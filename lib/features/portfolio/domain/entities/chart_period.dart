enum ChartPeriod {
  oneDay('1D'),
  oneWeek('1W'),
  oneMonth('1M'),
  sixMonths('6M'),
  yearToDate('YTD'),
  oneYear('1Y'),
  all('ALL');

  const ChartPeriod(this.value);
  
  final String value;

  static ChartPeriod fromValue(String value) {
    return ChartPeriod.values.firstWhere(
      (period) => period.value == value,
      orElse: () => throw ArgumentError('Invalid chart period: $value'),
    );
  }

  static List<ChartPeriod> get orderedPeriods => [
        oneDay,
        oneWeek,
        oneMonth,
        sixMonths,
        yearToDate,
        oneYear,
        all,
      ];
}

