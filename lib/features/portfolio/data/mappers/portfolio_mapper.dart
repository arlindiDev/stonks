import '../generated/portfolio.pb.dart' as proto;
import '../../domain/entities/portfolio_ui_item.dart';
import '../../domain/entities/portfolio_chart.dart';
import '../../domain/entities/portfolio_item.dart';
import '../../domain/entities/chart_period_data.dart';
import '../../domain/entities/chart_data_point.dart';
import '../../domain/entities/chart_period.dart';

class PortfolioMapper {
  static List<PortfolioUIItem> fromProtoResponse(
    proto.GetPortfolioResponse response,
  ) {
    final List<PortfolioUIItem> result = [];

    result.add(_fromProtoChart(response.chart));

    result.addAll(response.items.map(_fromProtoItem));

    return result;
  }

  static PortfolioChart _fromProtoChart(proto.PortfolioChart protoChart) {
    final Map<ChartPeriod, ChartPeriodData> periods = {};

    protoChart.periods.forEach((key, value) {
      final period = ChartPeriod.fromValue(key);

      periods[period] = ChartPeriodData(
        dataPoints: value.dataPoints.map(_fromProtoDataPoint).toList(),
        latestPrice: value.latestPrice,
        unrealizedPL: value.unrealizedPl,
        unrealizedPLPercent: value.unrealizedPlPercent,
        minValue: value.minValue,
        maxValue: value.maxValue,
      );
    });

    return PortfolioChart(periods: periods);
  }

  static ChartDataPoint _fromProtoDataPoint(proto.ChartDataPoint protoPoint) {
    return ChartDataPoint(
      value: protoPoint.value,
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        protoPoint.timestampMillis.toInt(),
      ),
      percentChange: protoPoint.percentChange,
    );
  }

  static PortfolioItem _fromProtoItem(proto.PortfolioItem protoItem) {
    return PortfolioItem(
      ticker: protoItem.ticker,
      companyName: protoItem.companyName,
      position: protoItem.position,
      avgPrice: protoItem.avgPrice,
      currentPrice: protoItem.currentPrice,
      dayChangePercent: protoItem.dayChangePercent,
      marketValue: protoItem.marketValue,
      portfolioPercent: protoItem.portfolioPercent,
      unrealizedPL: protoItem.unrealizedPl,
      unrealizedPLPercent: protoItem.unrealizedPlPercent,
    );
  }
}
