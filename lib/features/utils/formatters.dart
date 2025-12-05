import 'package:intl/intl.dart';

class Formatters {
  static final _currencyFormatter = NumberFormat.currency(
    symbol: '\$',
    decimalDigits: 2,
  );

  static String currency(double value) {
    return _currencyFormatter.format(value);
  }

  static String currencyWithSign(double value) {
    final sign = value >= 0 ? '+' : '-';
    return '$sign${_currencyFormatter.format(value.abs())}';
  }

  static String percent(double value, {int decimals = 2}) {
    return '${value.toStringAsFixed(decimals)}%';
  }

  static String percentWithSign(double value, {int decimals = 2}) {
    final sign = value >= 0 ? '+' : '';
    return '$sign${value.toStringAsFixed(decimals)}%';
  }

  static String shares(double value) {
    return value.toStringAsFixed(0);
  }
}
