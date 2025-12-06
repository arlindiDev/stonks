import 'package:flutter_test/flutter_test.dart';
import 'package:stocks/features/portfolio/domain/entities/chart_period.dart';

void main() {
  group('ChartPeriod', () {
    group('values', () {
      test('has correct string values', () {
        expect(ChartPeriod.oneDay.value, '1D');
        expect(ChartPeriod.oneWeek.value, '1W');
        expect(ChartPeriod.oneMonth.value, '1M');
        expect(ChartPeriod.sixMonths.value, '6M');
        expect(ChartPeriod.yearToDate.value, 'YTD');
        expect(ChartPeriod.oneYear.value, '1Y');
        expect(ChartPeriod.all.value, 'ALL');
      });

      test('has all 7 periods', () {
        expect(ChartPeriod.values.length, 7);
      });
    });

    group('fromValue', () {
      test('returns correct enum for valid 1D value', () {
        final period = ChartPeriod.fromValue('1D');
        expect(period, ChartPeriod.oneDay);
      });

      test('returns correct enum for valid 1W value', () {
        final period = ChartPeriod.fromValue('1W');
        expect(period, ChartPeriod.oneWeek);
      });

      test('returns correct enum for valid 1M value', () {
        final period = ChartPeriod.fromValue('1M');
        expect(period, ChartPeriod.oneMonth);
      });

      test('returns correct enum for valid 6M value', () {
        final period = ChartPeriod.fromValue('6M');
        expect(period, ChartPeriod.sixMonths);
      });

      test('returns correct enum for valid YTD value', () {
        final period = ChartPeriod.fromValue('YTD');
        expect(period, ChartPeriod.yearToDate);
      });

      test('returns correct enum for valid 1Y value', () {
        final period = ChartPeriod.fromValue('1Y');
        expect(period, ChartPeriod.oneYear);
      });

      test('returns correct enum for valid ALL value', () {
        final period = ChartPeriod.fromValue('ALL');
        expect(period, ChartPeriod.all);
      });

      test('throws ArgumentError for invalid value', () {
        expect(
          () => ChartPeriod.fromValue('INVALID'),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('throws ArgumentError with correct message for invalid value', () {
        try {
          ChartPeriod.fromValue('2W');
          fail('Expected ArgumentError to be thrown');
        } catch (e) {
          expect(e, isA<ArgumentError>());
          expect(e.toString(), contains('Invalid chart period: 2W'));
        }
      });

      test('is case sensitive', () {
        expect(
          () => ChartPeriod.fromValue('1d'),
          throwsA(isA<ArgumentError>()),
        );
      });

      test('throws for empty string', () {
        expect(
          () => ChartPeriod.fromValue(''),
          throwsA(isA<ArgumentError>()),
        );
      });
    });

    group('orderedPeriods', () {
      test('returns all periods in correct order', () {
        final periods = ChartPeriod.orderedPeriods;

        expect(periods.length, 7);
        expect(periods[0], ChartPeriod.oneDay);
        expect(periods[1], ChartPeriod.oneWeek);
        expect(periods[2], ChartPeriod.oneMonth);
        expect(periods[3], ChartPeriod.sixMonths);
        expect(periods[4], ChartPeriod.yearToDate);
        expect(periods[5], ChartPeriod.oneYear);
        expect(periods[6], ChartPeriod.all);
      });

      test('orderedPeriods matches values order', () {
        final periods = ChartPeriod.orderedPeriods;
        final values = ChartPeriod.values;

        for (var i = 0; i < periods.length; i++) {
          expect(periods[i], values[i]);
        }
      });

      test('orderedPeriods returns same instance each time', () {
        final periods1 = ChartPeriod.orderedPeriods;
        final periods2 = ChartPeriod.orderedPeriods;

        expect(periods1, equals(periods2));
      });
    });

    group('round trip conversion', () {
      test('fromValue and value are inverse operations', () {
        for (final period in ChartPeriod.values) {
          final convertedPeriod = ChartPeriod.fromValue(period.value);
          expect(convertedPeriod, period);
        }
      });
    });
  });
}

