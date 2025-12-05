import 'package:fixnum/fixnum.dart';
import 'generated/portfolio.pb.dart' as proto;

class MockDataHelper {
  static proto.GetPortfolioResponse getMockPortfolioResponse() {
    return proto.GetPortfolioResponse()
      ..total = _getMockTotal()
      ..chart = _getMockChart()
      ..items.addAll(_getMockItems());
  }

  static proto.PortfolioTotal _getMockTotal() {
    return proto.PortfolioTotal()..totalValue = 127439.25;
  }

  static proto.PortfolioChart _getMockChart() {
    final chart = proto.PortfolioChart();
    
    chart.periods['1D'] = _createPeriod(
      [
        _point(126800.0, DateTime(2025, 12, 5, 8, 44), 0.00),
        _point(126850.0, DateTime(2025, 12, 5, 8, 49), 0.04),
        _point(126900.0, DateTime(2025, 12, 5, 8, 54), 0.08),
        _point(126920.0, DateTime(2025, 12, 5, 8, 59), 0.09),
        _point(126940.0, DateTime(2025, 12, 5, 9, 4), 0.11),
        _point(126980.0, DateTime(2025, 12, 5, 9, 9), 0.14),
        _point(127000.0, DateTime(2025, 12, 5, 9, 14), 0.16),
        _point(127020.0, DateTime(2025, 12, 5, 9, 19), 0.17),
        _point(127040.0, DateTime(2025, 12, 5, 9, 24), 0.19),
        _point(127060.0, DateTime(2025, 12, 5, 9, 29), 0.21),
        _point(127080.0, DateTime(2025, 12, 5, 9, 34), 0.22),
        _point(127100.0, DateTime(2025, 12, 5, 9, 39), 0.24),
        _point(127120.0, DateTime(2025, 12, 5, 9, 44), 0.25),
        _point(127140.0, DateTime(2025, 12, 5, 9, 49), 0.27),
        _point(127160.0, DateTime(2025, 12, 5, 9, 54), 0.28),
        _point(127180.0, DateTime(2025, 12, 5, 9, 59), 0.30),
        _point(127190.0, DateTime(2025, 12, 5, 10, 4), 0.31),
        _point(127200.0, DateTime(2025, 12, 5, 10, 9), 0.32),
        _point(127210.0, DateTime(2025, 12, 5, 10, 14), 0.32),
        _point(127220.0, DateTime(2025, 12, 5, 10, 19), 0.33),
        _point(127230.0, DateTime(2025, 12, 5, 10, 24), 0.34),
        _point(127240.0, DateTime(2025, 12, 5, 10, 29), 0.35),
        _point(127250.0, DateTime(2025, 12, 5, 10, 34), 0.35),
        _point(127240.0, DateTime(2025, 12, 5, 10, 39), 0.35),
        _point(127220.0, DateTime(2025, 12, 5, 10, 44), 0.33),
        _point(127190.0, DateTime(2025, 12, 5, 10, 49), 0.31),
        _point(127150.0, DateTime(2025, 12, 5, 10, 54), 0.28),
        _point(127100.0, DateTime(2025, 12, 5, 10, 59), 0.24),
        _point(127060.0, DateTime(2025, 12, 5, 11, 4), 0.21),
        _point(127020.0, DateTime(2025, 12, 5, 11, 9), 0.17),
        _point(126980.0, DateTime(2025, 12, 5, 11, 14), 0.14),
        _point(126920.0, DateTime(2025, 12, 5, 11, 19), 0.09),
        _point(126860.0, DateTime(2025, 12, 5, 11, 24), 0.05),
        _point(126800.0, DateTime(2025, 12, 5, 11, 29), 0.00),
        _point(126740.0, DateTime(2025, 12, 5, 11, 34), -0.05),
        _point(126700.0, DateTime(2025, 12, 5, 11, 39), -0.08),
        _point(126680.0, DateTime(2025, 12, 5, 11, 44), -0.09),
        _point(126660.0, DateTime(2025, 12, 5, 11, 49), -0.11),
        _point(126640.0, DateTime(2025, 12, 5, 11, 54), -0.13),
        _point(126620.0, DateTime(2025, 12, 5, 11, 59), -0.14),
        _point(126600.0, DateTime(2025, 12, 5, 12, 4), -0.16),
        _point(126580.0, DateTime(2025, 12, 5, 12, 9), -0.17),
        _point(126560.0, DateTime(2025, 12, 5, 12, 14), -0.19),
        _point(126540.0, DateTime(2025, 12, 5, 12, 19), -0.20),
        _point(126520.0, DateTime(2025, 12, 5, 12, 24), -0.22),
        _point(126500.0, DateTime(2025, 12, 5, 12, 29), -0.24),
        _point(126480.0, DateTime(2025, 12, 5, 12, 34), -0.25),
        _point(126460.0, DateTime(2025, 12, 5, 12, 39), -0.27),
        _point(126440.0, DateTime(2025, 12, 5, 12, 44), -0.28),
        _point(126420.0, DateTime(2025, 12, 5, 12, 49), -0.30),
        _point(126400.0, DateTime(2025, 12, 5, 12, 54), -0.32),
        _point(126380.0, DateTime(2025, 12, 5, 12, 59), -0.33),
        _point(126360.0, DateTime(2025, 12, 5, 13, 4), -0.35),
        _point(126340.0, DateTime(2025, 12, 5, 13, 9), -0.36),
        _point(126320.0, DateTime(2025, 12, 5, 13, 14), -0.38),
        _point(126300.0, DateTime(2025, 12, 5, 13, 19), -0.39),
        _point(126280.0, DateTime(2025, 12, 5, 13, 24), -0.41),
        _point(126260.0, DateTime(2025, 12, 5, 13, 29), -0.43),
        _point(126240.0, DateTime(2025, 12, 5, 13, 34), -0.44),
        _point(126260.0, DateTime(2025, 12, 5, 13, 39), -0.43),
        _point(126300.0, DateTime(2025, 12, 5, 13, 44), -0.39),
        _point(126340.0, DateTime(2025, 12, 5, 13, 49), -0.36),
        _point(126380.0, DateTime(2025, 12, 5, 13, 54), -0.33),
        _point(126420.0, DateTime(2025, 12, 5, 13, 59), -0.30),
        _point(126460.0, DateTime(2025, 12, 5, 14, 4), -0.27),
        _point(126500.0, DateTime(2025, 12, 5, 14, 9), -0.24),
        _point(126540.0, DateTime(2025, 12, 5, 14, 14), -0.20),
        _point(126580.0, DateTime(2025, 12, 5, 14, 19), -0.17),
        _point(126620.0, DateTime(2025, 12, 5, 14, 24), -0.14),
        _point(126660.0, DateTime(2025, 12, 5, 14, 29), -0.11),
        _point(126700.0, DateTime(2025, 12, 5, 14, 34), -0.08),
        _point(126740.0, DateTime(2025, 12, 5, 14, 39), -0.05),
        _point(126780.0, DateTime(2025, 12, 5, 14, 44), -0.02),
        _point(126820.0, DateTime(2025, 12, 5, 14, 49), 0.02),
        _point(126860.0, DateTime(2025, 12, 5, 14, 54), 0.05),
        _point(126900.0, DateTime(2025, 12, 5, 14, 59), 0.08),
        _point(126940.0, DateTime(2025, 12, 5, 15, 4), 0.11),
        _point(126980.0, DateTime(2025, 12, 5, 15, 9), 0.14),
        _point(127020.0, DateTime(2025, 12, 5, 15, 14), 0.17),
        _point(127060.0, DateTime(2025, 12, 5, 15, 19), 0.21),
        _point(127100.0, DateTime(2025, 12, 5, 15, 24), 0.24),
        _point(127140.0, DateTime(2025, 12, 5, 15, 29), 0.27),
        _point(127180.0, DateTime(2025, 12, 5, 15, 34), 0.30),
        _point(127220.0, DateTime(2025, 12, 5, 15, 39), 0.33),
        _point(127260.0, DateTime(2025, 12, 5, 15, 44), 0.36),
        _point(127300.0, DateTime(2025, 12, 5, 15, 49), 0.39),
        _point(127340.0, DateTime(2025, 12, 5, 15, 54), 0.43),
        _point(127380.0, DateTime(2025, 12, 5, 15, 59), 0.46),
        _point(127420.0, DateTime(2025, 12, 5, 16, 4), 0.49),
        _point(127439.25, DateTime(2025, 12, 5, 16, 5), 0.50),
      ],
      127439.25,
      639.25,
      0.50,
    );
    
    chart.periods['1W'] = _createPeriod(
      [_point(125000.0, DateTime.now().subtract(const Duration(days: 7)), -1.91), _point(127439.25, DateTime.now(), 1.95)],
      127439.25,
      2439.25,
      1.95,
    );
    
    chart.periods['1M'] = _createPeriod(
      [_point(120000.0, DateTime.now().subtract(const Duration(days: 30)), -5.84), _point(127439.25, DateTime.now(), 6.20)],
      127439.25,
      7439.25,
      6.20,
    );
    
    chart.periods['3M'] = _createPeriod(
      [_point(115000.0, DateTime.now().subtract(const Duration(days: 90)), -9.76), _point(127439.25, DateTime.now(), 10.81)],
      127439.25,
      12439.25,
      10.81,
    );
    
    chart.periods['1Y'] = _createPeriod(
      [_point(100000.0, DateTime.now().subtract(const Duration(days: 365)), -21.53), _point(127439.25, DateTime.now(), 27.44)],
      127439.25,
      27439.25,
      27.44,
    );
    
    chart.periods['ALL'] = _createPeriod(
      [_point(50000.0, DateTime.now().subtract(const Duration(days: 1095)), -60.77), _point(127439.25, DateTime.now(), 154.88)],
      127439.25,
      77439.25,
      154.88,
    );
    
    return chart;
  }

  static proto.ChartPeriodData _createPeriod(
    List<proto.ChartDataPoint> points,
    double latestPrice,
    double unrealizedPl,
    double unrealizedPlPercent,
  ) {
    return proto.ChartPeriodData()
      ..dataPoints.addAll(points)
      ..latestPrice = latestPrice
      ..unrealizedPl = unrealizedPl
      ..unrealizedPlPercent = unrealizedPlPercent;
  }

  static proto.ChartDataPoint _point(double value, DateTime time, double change) {
    return proto.ChartDataPoint()
      ..value = value
      ..timestampMillis = Int64(time.millisecondsSinceEpoch)
      ..percentChange = change;
  }

  static List<proto.PortfolioItem> _getMockItems() {
    return [
      _item('AAPL', 150, 145.50, 180.25, 27037.50, 42.18, 5212.50, 23.88),
      _item('MSFT', 75, 310.00, 370.15, 27761.25, 43.31, 4511.25, 19.40),
      _item('GOOGL', 50, 125.75, 142.30, 7115.00, 11.10, 827.50, 13.15),
      _item('AMZN', 25, 340.50, 385.75, 9643.75, 15.04, 1131.25, 13.29),
      _item('NVDA', 100, 420.00, 495.20, 49520.00, 77.23, 7520.00, 17.90),
      _item('VOO', 75, 380.25, 425.80, 31935.00, 49.81, 3416.25, 11.98),
      _item('DXYZ', 200, 12.75, 9.50, 1900.00, 2.96, -650.00, -25.49),
    ];
  }

  static proto.PortfolioItem _item(
    String ticker,
    double position,
    double avgPrice,
    double currentPrice,
    double marketValue,
    double portfolioPercent,
    double unrealizedPl,
    double unrealizedPlPercent,
  ) {
    return proto.PortfolioItem()
      ..ticker = ticker
      ..position = position
      ..avgPrice = avgPrice
      ..currentPrice = currentPrice
      ..marketValue = marketValue
      ..portfolioPercent = portfolioPercent
      ..unrealizedPl = unrealizedPl
      ..unrealizedPlPercent = unrealizedPlPercent;
  }
}
