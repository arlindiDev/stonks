class PortfolioUIItem { }

class ChartPeriodData {
  final List<double> values;
  final double latestPrice;
  final double unrealizedPL;
  final double unrealizedPLPercent;

  ChartPeriodData({
    required this.values,
    required this.latestPrice,
    required this.unrealizedPL,
    required this.unrealizedPLPercent,
  });
}

class PortfolioChart extends PortfolioUIItem {
  final Map<String, ChartPeriodData> periods;

  PortfolioChart({
    required this.periods,
  });
}

class PortfolioTotal extends PortfolioUIItem {
  final double totalValue;

  PortfolioTotal({
    required this.totalValue,
  });
}

class PortfolioItem extends PortfolioUIItem {
  final String ticker;
  final double position;
  final double avgPrice;
  final double currentPrice;
  final double marketValue;
  final double portfolioPercent;
  final double unrealizedPL;
  final double unrealizedPLPercent;

  PortfolioItem({
    required this.ticker,
    required this.position,
    required this.avgPrice,
    required this.currentPrice,
    required this.marketValue,
    required this.portfolioPercent,
    required this.unrealizedPL,
    required this.unrealizedPLPercent,
  });
}

List<PortfolioUIItem> getMockPortfolioData() {
  return [
PortfolioChart(
  periods: {
    '1D': ChartPeriodData(
      values: [
        126800, 126850, 126900, 126920, 126940, 126960, 126980, 127020, 127040, 127060, 127080, 127100,
        127120, 127140, 127160, 127180, 127190, 127200, 127210, 127220, 127230, 127240, 127250, 127240,
        127220, 127190, 127150, 127100, 127060, 127020, 126980, 126940, 126900, 126860, 126820, 126780,
        126740, 126720, 126700, 126680, 126660, 126640, 126630, 126620, 126640, 126680, 126720, 126760,
        126800, 126840, 126880, 126920, 126960, 127000, 127040, 127020, 126990, 126960, 126930, 126900,
        126880, 126900, 126940, 126980, 127020, 127060, 127100, 127140, 127180, 127220, 127260, 127300,
        127320, 127350, 127360, 127380, 127390, 127410, 127420, 127430, 127439.25
      ],
      latestPrice: 127439.25,
      unrealizedPL: 639.25,
      unrealizedPLPercent: 0.50,
    ),

    '1W': ChartPeriodData(
      values: [
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
      ],
      latestPrice: 127439.25,
      unrealizedPL: 2439.25,
      unrealizedPLPercent: 1.95,
    ),

    '1M': ChartPeriodData(
      values: [
        // Earlier 3 weeks of the month (one data point per day = 21 points)
        130000, 129800, 129600, 129400, 129200, 128900, 128600, 128400, 128200, 128000,
        127800, 127600, 127400, 127200, 127000, 126900, 126800, 126700, 126600, 126500,
        126400,
        // Last week averaged down from 95 points to ~7 points (one per day)
        125950, 126420, 126700, 126700, 126740, 127080, 127439.25
      ],
      latestPrice: 127439.25,
      unrealizedPL: -2560.75,
      unrealizedPLPercent: -1.97,
    ),

    '6M': ChartPeriodData(
      values: [
        // Earlier 5 months with volatility, dips and rebounds (weekly averages = ~22 weeks)
        115000, 115400, 115800, 116200, 116600, 116200, 115800, 115400, 115000, 114600,
        114200, 114800, 115400, 116000, 116600, 117200, 117800, 118200, 118600, 119000,
        118400, 117800, 117200, 116600, 116200, 115800, 116200, 116600, 117000, 117400,
        117800, 118200, 118600, 119000, 119400, 119800, 120200, 120600, 121000, 121400,
        121800,
        // First mid-period pullback (deeper)
        120800, 119900, 118800, 117900, 117000, 116200, 115500, 115900, 116400, 116900,
        // Recovery rally into second half
        117600, 118300, 119000, 119700, 120400, 121100, 121800, 122400, 123000, 123600,
        // Second mid-period dip (sharper) then recovery
        122200, 120800, 119600, 118800, 119200, 120000, 120800, 121600, 122400, 123000,
        123600, 124200,
        // Last month: averaged down to weekly data points (4 weeks)
        129000, 127650, 126700, 127439.25
      ],
      latestPrice: 127439.25,
      unrealizedPL: 17439.25,
      unrealizedPLPercent: 15.85,
    ),

    'YTD': ChartPeriodData(
      values: [
        105000, 105400, 105800, 106200, 106600, 107000, 107400, 107800, 108200, 108600,
        109000, 109400, 109800, 110200, 110600, 111000, 111400, 111800, 112200, 112600,
        112300, 112000, 111700, 111400, 111100, 110800, 110500, 110200, 109900, 109600,
        110000, 110400, 110800, 111200, 111600, 112000, 112400, 112800, 113200, 113600,
        114000, 114400, 114800, 115200, 115600, 116000, 116400, 116800, 117200, 117600,
        116800, 116000, 115200, 114600, 114000, 113600, 113200, 113800, 114400, 115000,
        115600, 116200, 116800, 117400, 118000, 118600, 119200, 119800, 120400, 121000,
        121600, 122200, 122800, 123400, 123800, 124200, 124600, 125000, 125400, 125800,
        126500, 127000, 126700, 127439.25
      ],
      latestPrice: 127439.25,
      unrealizedPL: 22439.25,
      unrealizedPLPercent: 21.37,
    ),

    '1Y': ChartPeriodData(
      values: [
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
      ],
      latestPrice: 127439.25,
      unrealizedPL: 27439.25,
      unrealizedPLPercent: 27.44,
    ),

    '5Y': ChartPeriodData(
      values: [
        50000, 52000, 54000, 56000, 58000, 60000, 58000, 62000, 64000, 66000,
        48000, 42000, 36000, 42000, 40000, 44000, 48000, 42000, 46000, 50000,
        54000, 58000, 62000, 66000, 70000, 64000, 68000, 82000, 86000, 100000,
        94000, 98000, 102000, 106000, 100000, 102000, 114000, 113000, 114000, 116000,
        116000, 114000, 115500, 117000, 119000, 121000, 120000, 124500, 126000, 120000,
        107500, 106000, 106500, 107000, 108500, 112000, 116000, 120000, 123500, 125500, 126800, 127439.25
      ],
      latestPrice: 127439.25,
      unrealizedPL: 77439.25,
      unrealizedPLPercent: 154.88,
    ),

    'ALL': ChartPeriodData(
      values: [
        50000, 52000, 54000, 56000, 58000, 60000, 58000, 62000, 64000, 66000,
        48000, 42000, 36000, 42000, 40000, 44000, 48000, 42000, 46000, 50000,
        54000, 58000, 62000, 66000, 70000, 64000, 68000, 82000, 86000, 100000,
        94000, 98000, 102000, 106000, 100000, 102000, 114000, 113000, 114000, 116000,
        116000, 114000, 115500, 117000, 119000, 121000, 120000, 124500, 126000, 120000,
        107500, 106000, 106500, 107000, 108500, 112000, 116000, 120000, 123500, 125500, 126800, 127439.25
      ],
      latestPrice: 127439.25,
      unrealizedPL: 102439.25,
      unrealizedPLPercent: 409.76,
    ),
  },
),


PortfolioTotal(
      totalValue: 127439.25,
    ),
    PortfolioItem(
      ticker: 'AAPL',
      position: 50,
      avgPrice: 150.25,
      currentPrice: 195.50,
      marketValue: 9775.00,
      portfolioPercent: 15.25,
      unrealizedPL: 2262.50,
      unrealizedPLPercent: 30.12,
    ),
    PortfolioItem(
      ticker: 'GOOGL',
      position: 30,
      avgPrice: 125.80,
      currentPrice: 140.25,
      marketValue: 4207.50,
      portfolioPercent: 6.56,
      unrealizedPL: 433.50,
      unrealizedPLPercent: 11.48,
    ),
    PortfolioItem(
      ticker: 'BRK.B',
      position: 25,
      avgPrice: 340.50,
      currentPrice: 385.75,
      marketValue: 9643.75,
      portfolioPercent: 15.04,
      unrealizedPL: 1131.25,
      unrealizedPLPercent: 13.29,
    ),
    PortfolioItem(
      ticker: 'NVDA',
      position: 100,
      avgPrice: 420.00,
      currentPrice: 495.20,
      marketValue: 49520.00,
      portfolioPercent: 77.23,
      unrealizedPL: 7520.00,
      unrealizedPLPercent: 17.90,
    ),
    PortfolioItem(
      ticker: 'VOO',
      position: 75,
      avgPrice: 380.25,
      currentPrice: 425.80,
      marketValue: 31935.00,
      portfolioPercent: 49.81,
      unrealizedPL: 3416.25,
      unrealizedPLPercent: 11.98,
    ),
    PortfolioItem(
      ticker: 'DXYZ',
      position: 200,
      avgPrice: 45.50,
      currentPrice: 38.20,
      marketValue: 7640.00,
      portfolioPercent: 11.91,
      unrealizedPL: -1460.00,
      unrealizedPLPercent: -16.04,
    ),
    PortfolioItem(
      ticker: 'VTI',
      position: 60,
      avgPrice: 210.00,
      currentPrice: 245.30,
      marketValue: 14718.00,
      portfolioPercent: 22.95,
      unrealizedPL: 2118.00,
      unrealizedPLPercent: 16.81,
    ),
  ];
}
