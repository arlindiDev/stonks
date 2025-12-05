import '../generated/portfolio.pb.dart' as proto;
import '../mock_data.dart';

class PortfolioMapper {
  static List<PortfolioUIItem> fromProtoResponse(
    proto.GetPortfolioResponse response,
  ) {
    final List<PortfolioUIItem> result = [];

    result.add(PortfolioTotal(
      totalValue: response.total.totalValue,
    ));

    result.add(_fromProtoChart(response.chart));

    result.addAll(response.items.map(_fromProtoItem));

    return result;
  }

  static PortfolioChart _fromProtoChart(proto.PortfolioChart protoChart) {
    final Map<String, ChartPeriodData> periods = {};

    protoChart.periods.forEach((key, value) {
      periods[key] = ChartPeriodData(
        dataPoints: value.dataPoints.map(_fromProtoDataPoint).toList(),
        latestPrice: value.latestPrice,
        unrealizedPL: value.unrealizedPl,
        unrealizedPLPercent: value.unrealizedPlPercent,
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
      position: protoItem.position,
      avgPrice: protoItem.avgPrice,
      currentPrice: protoItem.currentPrice,
      marketValue: protoItem.marketValue,
      portfolioPercent: protoItem.portfolioPercent,
      unrealizedPL: protoItem.unrealizedPl,
      unrealizedPLPercent: protoItem.unrealizedPlPercent,
    );
  }
}
