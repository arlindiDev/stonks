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
      _create1WData(),
      127439.25,
      2439.25,
      1.95,
    );
    
    chart.periods['1M'] = _createPeriod(
      _create1MData(),
      127439.25,
      -2560.75,
      -1.97,
    );
    
    chart.periods['6M'] = _createPeriod(
      _create6MData(),
      127439.25,
      17439.25,
      15.85,
    );
    
    chart.periods['YTD'] = _createPeriod(
      _createYTDData(),
      127439.25,
      22439.25,
      21.37,
    );
    
    chart.periods['1Y'] = _createPeriod(
      _create1YData(),
      127439.25,
      27439.25,
      27.44,
    );
    
    chart.periods['ALL'] = _createPeriod(
      _create1YData(), // Same as 1Y
      127439.25,
      27439.25,
      27.44,
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

  // 1W data - 94 points at 2-hour intervals
  static List<proto.ChartDataPoint> _create1WData() {
    final values = [
      125800.0, 125900.0, 126000.0, 126050.0, 126120.0, 126160.0, 126200.0, 126250.0, 126300.0, 126340.0,
      126380.0, 126420.0, 126460.0, 126480.0, 126500.0, 126520.0, 126540.0, 126560.0, 126580.0, 126600.0,
      126620.0, 126640.0, 126660.0, 126680.0, 126700.0, 126720.0, 126740.0, 126760.0, 126780.0, 126800.0,
      126820.0, 126840.0, 126860.0, 126880.0, 126880.0, 126860.0, 126820.0, 126780.0, 126740.0, 126700.0,
      126660.0, 126620.0, 126600.0, 126580.0, 126560.0, 126580.0, 126620.0, 126660.0, 126700.0, 126740.0,
      126780.0, 126820.0, 126860.0, 126900.0, 126860.0, 126820.0, 126780.0, 126740.0, 126700.0, 126660.0,
      126640.0, 126660.0, 126700.0, 126740.0, 126780.0, 126820.0, 126860.0, 126900.0, 126940.0, 126980.0,
      127000.0, 127020.0, 127040.0, 127060.0, 127080.0, 127100.0, 127120.0, 127140.0, 127160.0, 127180.0,
      127160.0, 127140.0, 127120.0, 127140.0, 127180.0, 127220.0, 127260.0, 127300.0, 127320.0, 127340.0,
      127360.0, 127380.0, 127400.0, 127420.0, 127439.25
    ];
    final start = DateTime(2025, 11, 28, 15, 14);
    final initialValue = values.first;
    return List.generate(values.length, (i) {
      final value = values[i];
      final timestamp = start.add(Duration(hours: i * 2));
      final percentChange = ((value - initialValue) / initialValue) * 100;
      return _point(value, timestamp, percentChange);
    });
  }

  // 1M data - 28 points at daily intervals
  static List<proto.ChartDataPoint> _create1MData() {
    final values = [
      130000.0, 129800.0, 129600.0, 129400.0, 129200.0, 128900.0, 128600.0, 128400.0, 128200.0, 128000.0,
      127800.0, 127600.0, 127400.0, 127200.0, 127000.0, 126900.0, 126800.0, 126700.0, 126600.0, 126500.0,
      126400.0, 125950.0, 126420.0, 126700.0, 126700.0, 126740.0, 127080.0, 127439.25
    ];
    final start = DateTime(2025, 11, 7, 15, 14);
    final initialValue = values.first;
    return List.generate(values.length, (i) {
      final value = values[i];
      final timestamp = start.add(Duration(days: i));
      final percentChange = ((value - initialValue) / initialValue) * 100;
      return _point(value, timestamp, percentChange);
    });
  }

  // 6M data - 76 points at weekly intervals
  static List<proto.ChartDataPoint> _create6MData() {
    final values = [
      115000.0, 115400.0, 115800.0, 116200.0, 116600.0, 116200.0, 115800.0, 115400.0, 115000.0, 114600.0,
      114200.0, 114800.0, 115400.0, 116000.0, 116600.0, 117200.0, 117800.0, 118200.0, 118600.0, 119000.0,
      118400.0, 117800.0, 117200.0, 116600.0, 116200.0, 115800.0, 116200.0, 116600.0, 117000.0, 117400.0,
      117800.0, 118200.0, 118600.0, 119000.0, 119400.0, 119800.0, 120200.0, 120600.0, 121000.0, 121400.0,
      121800.0, 120800.0, 119900.0, 118800.0, 117900.0, 117000.0, 116200.0, 115500.0, 115900.0, 116400.0,
      116900.0, 117600.0, 118300.0, 119000.0, 119700.0, 120400.0, 121100.0, 121800.0, 122400.0, 123000.0,
      123600.0, 122200.0, 120800.0, 119600.0, 118800.0, 119200.0, 120000.0, 120800.0, 121600.0, 122400.0,
      123000.0, 123600.0, 124200.0, 129000.0, 127650.0, 126700.0, 127439.25
    ];
    final start = DateTime(2025, 6, 8, 16, 14);
    final initialValue = values.first;
    return List.generate(values.length, (i) {
      final value = values[i];
      final timestamp = start.add(Duration(days: i * 7));
      final percentChange = ((value - initialValue) / initialValue) * 100;
      return _point(value, timestamp, percentChange);
    });
  }

  // YTD data - 84 points at 3-day intervals
  static List<proto.ChartDataPoint> _createYTDData() {
    final values = [
      105000.0, 105400.0, 105800.0, 106200.0, 106600.0, 107000.0, 107400.0, 107800.0, 108200.0, 108600.0,
      109000.0, 109400.0, 109800.0, 110200.0, 110600.0, 111000.0, 111400.0, 111800.0, 112200.0, 112600.0,
      112300.0, 112000.0, 111700.0, 111400.0, 111100.0, 110800.0, 110500.0, 110200.0, 109900.0, 109600.0,
      110000.0, 110400.0, 110800.0, 111200.0, 111600.0, 112000.0, 112400.0, 112800.0, 113200.0, 113600.0,
      114000.0, 114400.0, 114800.0, 115200.0, 115600.0, 116000.0, 116400.0, 116800.0, 117200.0, 117600.0,
      116800.0, 116000.0, 115200.0, 114600.0, 114000.0, 113600.0, 113200.0, 113800.0, 114400.0, 115000.0,
      115600.0, 116200.0, 116800.0, 117400.0, 118000.0, 118600.0, 119200.0, 119800.0, 120400.0, 121000.0,
      121600.0, 122200.0, 122800.0, 123400.0, 123800.0, 124200.0, 124600.0, 125000.0, 125400.0, 125800.0,
      126500.0, 127000.0, 126700.0, 127439.25
    ];
    final start = DateTime(2025, 1, 4, 15, 14);
    final initialValue = values.first;
    return List.generate(values.length, (i) {
      final value = values[i];
      final timestamp = start.add(Duration(days: i * 3));
      final percentChange = ((value - initialValue) / initialValue) * 100;
      return _point(value, timestamp, percentChange);
    });
  }

  // 1Y data - 86 points at 4-day intervals
  static List<proto.ChartDataPoint> _create1YData() {
    final values = [
      98000.0, 99000.0, 100000.0,
      105000.0, 105400.0, 105800.0, 106200.0, 106600.0, 107000.0, 107400.0, 107800.0, 108200.0, 108600.0,
      109000.0, 109400.0, 109800.0, 110200.0, 110600.0, 111000.0, 111400.0, 111800.0, 112200.0, 112600.0,
      112300.0, 112000.0, 111700.0, 111400.0, 111100.0, 110800.0, 110500.0, 110200.0, 109900.0, 109600.0,
      110000.0, 110400.0, 110800.0, 111200.0, 111600.0, 112000.0, 112400.0, 112800.0, 113200.0, 113600.0,
      114000.0, 114400.0, 114800.0, 115200.0, 115600.0, 116000.0, 116400.0, 116800.0, 117200.0, 117600.0,
      116800.0, 116000.0, 115200.0, 114600.0, 114000.0, 113600.0, 113200.0, 113800.0, 114400.0, 115000.0,
      115600.0, 116200.0, 116800.0, 117400.0, 118000.0, 118600.0, 119200.0, 119800.0, 120400.0, 121000.0,
      121600.0, 122200.0, 122800.0, 123400.0, 123800.0, 124200.0, 124600.0, 125000.0, 125400.0, 125800.0,
      126500.0, 127000.0, 126700.0, 127439.25
    ];
    final start = DateTime(2024, 12, 5, 15, 14);
    final initialValue = values.first;
    return List.generate(values.length, (i) {
      final value = values[i];
      final timestamp = start.add(Duration(days: i * 4));
      final percentChange = ((value - initialValue) / initialValue) * 100;
      return _point(value, timestamp, percentChange);
    });
  }
}
