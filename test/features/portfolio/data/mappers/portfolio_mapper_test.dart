import 'package:flutter_test/flutter_test.dart';
import 'package:fixnum/fixnum.dart';
import 'package:stocks/features/portfolio/data/generated/portfolio.pb.dart' as proto;
import 'package:stocks/features/portfolio/data/mappers/portfolio_mapper.dart';
import 'package:stocks/features/portfolio/domain/entities/portfolio_total.dart';
import 'package:stocks/features/portfolio/domain/entities/portfolio_chart.dart';
import 'package:stocks/features/portfolio/domain/entities/portfolio_item.dart';
import 'package:stocks/features/portfolio/domain/entities/chart_period.dart';

void main() {
  group('PortfolioMapper', () {
    group('fromProtoResponse', () {
      test('maps complete proto response correctly', () {
        final protoResponse = proto.GetPortfolioResponse(
          total: proto.PortfolioTotal(totalValue: 125000.0),
          chart: proto.PortfolioChart(
            periods: {
              '1D': proto.ChartPeriodData(
                dataPoints: [
                  proto.ChartDataPoint(
                    value: 121875.0,
                    timestampMillis: Int64(1704103800000), // 2024-01-01 09:30:00
                    percentChange: 0.0,
                  ),
                  proto.ChartDataPoint(
                    value: 125000.0,
                    timestampMillis: Int64(1704107400000), // 2024-01-01 10:30:00
                    percentChange: 2.56,
                  ),
                ],
                latestPrice: 125000.0,
                unrealizedPl: 3125.0,
                unrealizedPlPercent: 2.56,
              ),
            },
          ),
          items: [
            proto.PortfolioItem(
              ticker: 'AAPL',
              position: 100.0,
              avgPrice: 150.0,
              currentPrice: 175.0,
              marketValue: 17500.0,
              portfolioPercent: 14.0,
              unrealizedPl: 2500.0,
              unrealizedPlPercent: 16.67,
            ),
          ],
        );

        final result = PortfolioMapper.fromProtoResponse(protoResponse);

        expect(result.length, 3);
        expect(result[0], isA<PortfolioTotal>());
        expect(result[1], isA<PortfolioChart>());
        expect(result[2], isA<PortfolioItem>());
      });

      test('maps PortfolioTotal correctly', () {
        final protoResponse = proto.GetPortfolioResponse(
          total: proto.PortfolioTotal(totalValue: 250000.50),
          chart: proto.PortfolioChart(),
          items: [],
        );

        final result = PortfolioMapper.fromProtoResponse(protoResponse);
        final total = result[0] as PortfolioTotal;

        expect(total.totalValue, 250000.50);
      });

      test('maps PortfolioChart with multiple periods', () {
        final protoResponse = proto.GetPortfolioResponse(
          total: proto.PortfolioTotal(totalValue: 100000.0),
          chart: proto.PortfolioChart(
            periods: {
              '1D': proto.ChartPeriodData(
                dataPoints: [],
                latestPrice: 100000.0,
                unrealizedPl: 1000.0,
                unrealizedPlPercent: 1.0,
              ),
              '1W': proto.ChartPeriodData(
                dataPoints: [],
                latestPrice: 100000.0,
                unrealizedPl: 5000.0,
                unrealizedPlPercent: 5.0,
              ),
              '1M': proto.ChartPeriodData(
                dataPoints: [],
                latestPrice: 100000.0,
                unrealizedPl: 10000.0,
                unrealizedPlPercent: 10.0,
              ),
            },
          ),
          items: [],
        );

        final result = PortfolioMapper.fromProtoResponse(protoResponse);
        final chart = result[1] as PortfolioChart;

        expect(chart.periods.length, 3);
        expect(chart.periods.containsKey(ChartPeriod.oneDay), true);
        expect(chart.periods.containsKey(ChartPeriod.oneWeek), true);
        expect(chart.periods.containsKey(ChartPeriod.oneMonth), true);
      });

      test('maps multiple portfolio items correctly', () {
        final protoResponse = proto.GetPortfolioResponse(
          total: proto.PortfolioTotal(totalValue: 100000.0),
          chart: proto.PortfolioChart(),
          items: [
            proto.PortfolioItem(
              ticker: 'AAPL',
              position: 100.0,
              avgPrice: 150.0,
              currentPrice: 175.0,
              marketValue: 17500.0,
              portfolioPercent: 17.5,
              unrealizedPl: 2500.0,
              unrealizedPlPercent: 16.67,
            ),
            proto.PortfolioItem(
              ticker: 'GOOGL',
              position: 50.0,
              avgPrice: 140.0,
              currentPrice: 155.0,
              marketValue: 7750.0,
              portfolioPercent: 7.75,
              unrealizedPl: 750.0,
              unrealizedPlPercent: 10.71,
            ),
          ],
        );

        final result = PortfolioMapper.fromProtoResponse(protoResponse);

        expect(result.length, 4); // total + chart + 2 items
        expect(result[2], isA<PortfolioItem>());
        expect(result[3], isA<PortfolioItem>());

        final item1 = result[2] as PortfolioItem;
        final item2 = result[3] as PortfolioItem;

        expect(item1.ticker, 'AAPL');
        expect(item2.ticker, 'GOOGL');
      });
    });

    group('_fromProtoChart', () {
      test('maps chart period data correctly', () {
        final protoResponse = proto.GetPortfolioResponse(
          total: proto.PortfolioTotal(totalValue: 100000.0),
          chart: proto.PortfolioChart(
            periods: {
              '1D': proto.ChartPeriodData(
                dataPoints: [
                  proto.ChartDataPoint(
                    value: 99000.0,
                    timestampMillis: Int64(1704103800000),
                    percentChange: 0.0,
                  ),
                  proto.ChartDataPoint(
                    value: 100000.0,
                    timestampMillis: Int64(1704107400000),
                    percentChange: 1.01,
                  ),
                ],
                latestPrice: 100000.0,
                unrealizedPl: 1000.0,
                unrealizedPlPercent: 1.01,
              ),
            },
          ),
          items: [],
        );

        final result = PortfolioMapper.fromProtoResponse(protoResponse);
        final chart = result[1] as PortfolioChart;
        final periodData = chart.periods[ChartPeriod.oneDay]!;

        expect(periodData.dataPoints.length, 2);
        expect(periodData.latestPrice, 100000.0);
        expect(periodData.unrealizedPL, 1000.0);
        expect(periodData.unrealizedPLPercent, 1.01);
      });

      test('maps all chart periods', () {
        final protoResponse = proto.GetPortfolioResponse(
          total: proto.PortfolioTotal(totalValue: 100000.0),
          chart: proto.PortfolioChart(
            periods: {
              '1D': proto.ChartPeriodData(latestPrice: 100000, unrealizedPl: 1000, unrealizedPlPercent: 1.0),
              '1W': proto.ChartPeriodData(latestPrice: 100000, unrealizedPl: 5000, unrealizedPlPercent: 5.0),
              '1M': proto.ChartPeriodData(latestPrice: 100000, unrealizedPl: 10000, unrealizedPlPercent: 10.0),
              '6M': proto.ChartPeriodData(latestPrice: 100000, unrealizedPl: 15000, unrealizedPlPercent: 15.0),
              'YTD': proto.ChartPeriodData(latestPrice: 100000, unrealizedPl: 20000, unrealizedPlPercent: 20.0),
              '1Y': proto.ChartPeriodData(latestPrice: 100000, unrealizedPl: 25000, unrealizedPlPercent: 25.0),
              'ALL': proto.ChartPeriodData(latestPrice: 100000, unrealizedPl: 50000, unrealizedPlPercent: 50.0),
            },
          ),
          items: [],
        );

        final result = PortfolioMapper.fromProtoResponse(protoResponse);
        final chart = result[1] as PortfolioChart;

        expect(chart.periods.length, 7);
        expect(chart.periods[ChartPeriod.oneDay]!.unrealizedPL, 1000);
        expect(chart.periods[ChartPeriod.oneWeek]!.unrealizedPL, 5000);
        expect(chart.periods[ChartPeriod.oneMonth]!.unrealizedPL, 10000);
        expect(chart.periods[ChartPeriod.sixMonths]!.unrealizedPL, 15000);
        expect(chart.periods[ChartPeriod.yearToDate]!.unrealizedPL, 20000);
        expect(chart.periods[ChartPeriod.oneYear]!.unrealizedPL, 25000);
        expect(chart.periods[ChartPeriod.all]!.unrealizedPL, 50000);
      });
    });

    group('_fromProtoDataPoint', () {
      test('converts timestamp correctly', () {
        final timestamp = Int64(1704103800000); // 2024-01-01 09:30:00 UTC
        final protoResponse = proto.GetPortfolioResponse(
          total: proto.PortfolioTotal(totalValue: 100000.0),
          chart: proto.PortfolioChart(
            periods: {
              '1D': proto.ChartPeriodData(
                dataPoints: [
                  proto.ChartDataPoint(
                    value: 100000.0,
                    timestampMillis: timestamp,
                    percentChange: 0.0,
                  ),
                ],
                latestPrice: 100000.0,
                unrealizedPl: 0.0,
                unrealizedPlPercent: 0.0,
              ),
            },
          ),
          items: [],
        );

        final result = PortfolioMapper.fromProtoResponse(protoResponse);
        final chart = result[1] as PortfolioChart;
        final dataPoint = chart.periods[ChartPeriod.oneDay]!.dataPoints[0];

        expect(dataPoint.timestamp.millisecondsSinceEpoch, 1704103800000);
        expect(dataPoint.value, 100000.0);
        expect(dataPoint.percentChange, 0.0);
      });

      test('maps all data point fields correctly', () {
        final protoResponse = proto.GetPortfolioResponse(
          total: proto.PortfolioTotal(totalValue: 100000.0),
          chart: proto.PortfolioChart(
            periods: {
              '1D': proto.ChartPeriodData(
                dataPoints: [
                  proto.ChartDataPoint(
                    value: 98500.50,
                    timestampMillis: Int64(1704103800000),
                    percentChange: -1.5,
                  ),
                ],
                latestPrice: 100000.0,
                unrealizedPl: 0.0,
                unrealizedPlPercent: 0.0,
              ),
            },
          ),
          items: [],
        );

        final result = PortfolioMapper.fromProtoResponse(protoResponse);
        final chart = result[1] as PortfolioChart;
        final dataPoint = chart.periods[ChartPeriod.oneDay]!.dataPoints[0];

        expect(dataPoint.value, 98500.50);
        expect(dataPoint.percentChange, -1.5);
      });
    });

    group('_fromProtoItem', () {
      test('maps all portfolio item fields correctly', () {
        final protoResponse = proto.GetPortfolioResponse(
          total: proto.PortfolioTotal(totalValue: 100000.0),
          chart: proto.PortfolioChart(),
          items: [
            proto.PortfolioItem(
              ticker: 'TSLA',
              position: 25.5,
              avgPrice: 200.75,
              currentPrice: 250.25,
              marketValue: 6381.375,
              portfolioPercent: 6.38,
              unrealizedPl: 1262.25,
              unrealizedPlPercent: 24.68,
            ),
          ],
        );

        final result = PortfolioMapper.fromProtoResponse(protoResponse);
        final item = result[2] as PortfolioItem;

        expect(item.ticker, 'TSLA');
        expect(item.position, 25.5);
        expect(item.avgPrice, 200.75);
        expect(item.currentPrice, 250.25);
        expect(item.marketValue, 6381.375);
        expect(item.portfolioPercent, 6.38);
        expect(item.unrealizedPL, 1262.25);
        expect(item.unrealizedPLPercent, 24.68);
      });

      test('handles negative unrealized P/L', () {
        final protoResponse = proto.GetPortfolioResponse(
          total: proto.PortfolioTotal(totalValue: 100000.0),
          chart: proto.PortfolioChart(),
          items: [
            proto.PortfolioItem(
              ticker: 'LOSS',
              position: 100.0,
              avgPrice: 100.0,
              currentPrice: 80.0,
              marketValue: 8000.0,
              portfolioPercent: 8.0,
              unrealizedPl: -2000.0,
              unrealizedPlPercent: -20.0,
            ),
          ],
        );

        final result = PortfolioMapper.fromProtoResponse(protoResponse);
        final item = result[2] as PortfolioItem;

        expect(item.unrealizedPL, -2000.0);
        expect(item.unrealizedPLPercent, -20.0);
      });
    });

    group('edge cases', () {
      test('handles empty items list', () {
        final protoResponse = proto.GetPortfolioResponse(
          total: proto.PortfolioTotal(totalValue: 100000.0),
          chart: proto.PortfolioChart(),
          items: [],
        );

        final result = PortfolioMapper.fromProtoResponse(protoResponse);

        expect(result.length, 2);
        expect(result[0], isA<PortfolioTotal>());
        expect(result[1], isA<PortfolioChart>());
      });

      test('handles chart with empty periods', () {
        final protoResponse = proto.GetPortfolioResponse(
          total: proto.PortfolioTotal(totalValue: 100000.0),
          chart: proto.PortfolioChart(periods: {}),
          items: [],
        );

        final result = PortfolioMapper.fromProtoResponse(protoResponse);
        final chart = result[1] as PortfolioChart;

        expect(chart.periods.isEmpty, true);
      });

      test('handles zero values', () {
        final protoResponse = proto.GetPortfolioResponse(
          total: proto.PortfolioTotal(totalValue: 0.0),
          chart: proto.PortfolioChart(),
          items: [
            proto.PortfolioItem(
              ticker: 'ZERO',
              position: 0.0,
              avgPrice: 0.0,
              currentPrice: 0.0,
              marketValue: 0.0,
              portfolioPercent: 0.0,
              unrealizedPl: 0.0,
              unrealizedPlPercent: 0.0,
            ),
          ],
        );

        final result = PortfolioMapper.fromProtoResponse(protoResponse);
        final total = result[0] as PortfolioTotal;
        final item = result[2] as PortfolioItem;

        expect(total.totalValue, 0.0);
        expect(item.position, 0.0);
        expect(item.marketValue, 0.0);
      });
    });
  });
}

