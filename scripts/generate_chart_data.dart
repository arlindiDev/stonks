// Run this script with: dart run scripts/generate_chart_data.dart
// Copy the output and paste it into lib/features/mock_data.dart

void main() {
  final now = DateTime.now();
  
  // 1D - 5 minute intervals
  final List<double> values1D = [
    126800, 126850, 126900, 126920, 126940, 126960, 126980, 127020, 127040, 127060, 127080, 127100,
    127120, 127140, 127160, 127180, 127190, 127200, 127210, 127220, 127230, 127240, 127250, 127240,
    127220, 127190, 127150, 127100, 127060, 127020, 126980, 126940, 126900, 126860, 126820, 126780,
    126740, 126720, 126700, 126680, 126660, 126640, 126630, 126620, 126640, 126680, 126720, 126760,
    126800, 126840, 126880, 126920, 126960, 127000, 127040, 127020, 126990, 126960, 126930, 126900,
    126880, 126900, 126940, 126980, 127020, 127060, 127100, 127140, 127180, 127220, 127260, 127300,
    127320, 127350, 127360, 127380, 127390, 127410, 127420, 127430, 127439.25
  ];
  
  // 1W - 2 hour intervals
  final List<double> values1W = [
    125800, 125900, 126000, 126050, 126120, 126160, 126200, 126250, 126300, 126340,
    126380, 126420, 126460, 126480, 126500, 126520, 126540, 126560, 126580, 126600,
    126620, 126640, 126660, 126680, 126700, 126720, 126740, 126760, 126780, 126800,
    126820, 126840, 126860, 126880, 126880, 126860, 126820, 126780, 126740, 126700,
    126660, 126620, 126600, 126580, 126560, 126580, 126620, 126660, 126700, 126740,
    126780, 126820, 126860, 126900, 126860, 126820, 126780, 126740, 126700, 126660,
    126640, 126660, 126700, 126740, 126780, 126820, 126860, 126900, 126940, 126980,
    127000, 127020, 127040, 127060, 127080, 127100, 127120, 127140, 127160, 127180,
    127160, 127140, 127120, 127140, 127180, 127220, 127260, 127300, 127320, 127340,
    127360, 127380, 127400, 127420, 127439.25
  ];
  
  // 1M - 1 day intervals
  final List<double> values1M = [
    130000, 129800, 129600, 129400, 129200, 128900, 128600, 128400, 128200, 128000,
    127800, 127600, 127400, 127200, 127000, 126900, 126800, 126700, 126600, 126500,
    126400, 125950, 126420, 126700, 126700, 126740, 127080, 127439.25
  ];
  
  // 6M - weekly intervals
  final List<double> values6M = [
    115000, 115400, 115800, 116200, 116600, 116200, 115800, 115400, 115000, 114600,
    114200, 114800, 115400, 116000, 116600, 117200, 117800, 118200, 118600, 119000,
    118400, 117800, 117200, 116600, 116200, 115800, 116200, 116600, 117000, 117400,
    117800, 118200, 118600, 119000, 119400, 119800, 120200, 120600, 121000, 121400,
    121800, 120800, 119900, 118800, 117900, 117000, 116200, 115500, 115900, 116400,
    116900, 117600, 118300, 119000, 119700, 120400, 121100, 121800, 122400, 123000,
    123600, 122200, 120800, 119600, 118800, 119200, 120000, 120800, 121600, 122400,
    123000, 123600, 124200, 129000, 127650, 126700, 127439.25
  ];
  
  // YTD - varies
  final List<double> valuesYTD = [
    105000, 105400, 105800, 106200, 106600, 107000, 107400, 107800, 108200, 108600,
    109000, 109400, 109800, 110200, 110600, 111000, 111400, 111800, 112200, 112600,
    112300, 112000, 111700, 111400, 111100, 110800, 110500, 110200, 109900, 109600,
    110000, 110400, 110800, 111200, 111600, 112000, 112400, 112800, 113200, 113600,
    114000, 114400, 114800, 115200, 115600, 116000, 116400, 116800, 117200, 117600,
    116800, 116000, 115200, 114600, 114000, 113600, 113200, 113800, 114400, 115000,
    115600, 116200, 116800, 117400, 118000, 118600, 119200, 119800, 120400, 121000,
    121600, 122200, 122800, 123400, 123800, 124200, 124600, 125000, 125400, 125800,
    126500, 127000, 126700, 127439.25
  ];
  
  // 1Y - varies
  final List<double> values1Y = [
    98000, 99000, 100000, 
    105000, 105400, 105800, 106200, 106600, 107000, 107400, 107800, 108200, 108600,
    109000, 109400, 109800, 110200, 110600, 111000, 111400, 111800, 112200, 112600,
    112300, 112000, 111700, 111400, 111100, 110800, 110500, 110200, 109900, 109600,
    110000, 110400, 110800, 111200, 111600, 112000, 112400, 112800, 113200, 113600,
    114000, 114400, 114800, 115200, 115600, 116000, 116400, 116800, 117200, 117600,
    116800, 116000, 115200, 114600, 114000, 113600, 113200, 113800, 114400, 115000,
    115600, 116200, 116800, 117400, 118000, 118600, 119200, 119800, 120400, 121000,
    121600, 122200, 122800, 123400, 123800, 124200, 124600, 125000, 125400, 125800,
    126500, 127000, 126700, 127439.25
  ];
  
  // 5Y - varies
  final List<double> values5Y = [
    50000, 52000, 54000, 56000, 58000, 60000, 58000, 62000, 64000, 66000,
    48000, 42000, 36000, 42000, 40000, 44000, 48000, 42000, 46000, 50000,
    54000, 58000, 62000, 66000, 70000, 64000, 68000, 82000, 86000, 100000,
    94000, 98000, 102000, 106000, 100000, 102000, 114000, 113000, 114000, 116000,
    116000, 114000, 115500, 117000, 119000, 121000, 120000, 124500, 126000, 120000,
    107500, 106000, 106500, 107000, 108500, 112000, 116000, 120000, 123500, 125500, 126800, 127439.25
  ];
  
  // ALL - same as 5Y
  final valuesALL = values5Y;
  
  print('// Generated chart data - copy this into mock_data.dart\n');
  print("'1D': ChartPeriodData(");
  printDataPoints(values1D, const Duration(minutes: 5), now.subtract(const Duration(hours: 6, minutes: 30)));
  print('  latestPrice: 127439.25,');
  print('  unrealizedPL: 639.25,');
  print('  unrealizedPLPercent: 0.50,');
  print('),\n');
  
  print("'1W': ChartPeriodData(");
  printDataPoints(values1W, const Duration(hours: 2), now.subtract(const Duration(days: 7)));
  print('  latestPrice: 127439.25,');
  print('  unrealizedPL: 2439.25,');
  print('  unrealizedPLPercent: 1.95,');
  print('),\n');
  
  print("'1M': ChartPeriodData(");
  printDataPoints(values1M, const Duration(days: 1), now.subtract(const Duration(days: 28)));
  print('  latestPrice: 127439.25,');
  print('  unrealizedPL: -2560.75,');
  print('  unrealizedPLPercent: -1.97,');
  print('),\n');
  
  print("'6M': ChartPeriodData(");
  printDataPoints(values6M, const Duration(days: 7), now.subtract(const Duration(days: 180)));
  print('  latestPrice: 127439.25,');
  print('  unrealizedPL: 17439.25,');
  print('  unrealizedPLPercent: 15.85,');
  print('),\n');
  
  print("'YTD': ChartPeriodData(");
  printDataPoints(valuesYTD, const Duration(days: 3), now.subtract(const Duration(days: 335)));
  print('  latestPrice: 127439.25,');
  print('  unrealizedPL: 22439.25,');
  print('  unrealizedPLPercent: 21.37,');
  print('),\n');
  
  print("'1Y': ChartPeriodData(");
  printDataPoints(values1Y, const Duration(days: 4), now.subtract(const Duration(days: 365)));
  print('  latestPrice: 127439.25,');
  print('  unrealizedPL: 27439.25,');
  print('  unrealizedPLPercent: 27.44,');
  print('),\n');
  
  print("'5Y': ChartPeriodData(");
  printDataPoints(values5Y, const Duration(days: 30), now.subtract(const Duration(days: 1825)));
  print('  latestPrice: 127439.25,');
  print('  unrealizedPL: 77439.25,');
  print('  unrealizedPLPercent: 154.88,');
  print('),\n');
  
  print("'ALL': ChartPeriodData(");
  printDataPoints(valuesALL, const Duration(days: 30), now.subtract(const Duration(days: 1825)));
  print('  latestPrice: 127439.25,');
  print('  unrealizedPL: 102439.25,');
  print('  unrealizedPLPercent: 409.76,');
  print('),');
}

void printDataPoints(List<double> values, Duration interval, DateTime start) {
  final initialValue = values.first;
  
  print('  dataPoints: [');
  for (int i = 0; i < values.length; i++) {
    final timestamp = start.add(interval * i);
    final percentChange = ((values[i] - initialValue) / initialValue) * 100;
    
    print('    ChartDataPoint(');
    print('      value: ${values[i]},');
    print('      timestamp: DateTime(${timestamp.year}, ${timestamp.month}, ${timestamp.day}, ${timestamp.hour}, ${timestamp.minute}),');
    print('      percentChange: ${percentChange.toStringAsFixed(2)},');
    print('    ),');
  }
  print('  ],');
}
