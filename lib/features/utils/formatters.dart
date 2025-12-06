import 'dart:math';
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

  static String formatDate(DateTime date, String period) {
    switch (period) {
      case '1D':
        return '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
      case '1W':
        final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
        return '${days[date.weekday - 1]} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
      case '1M':
        final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        return '${months[date.month - 1]} ${date.day}';
      case '6M':
      case 'YTD':
      case '1Y':
        final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        return '${months[date.month - 1]} ${date.day}';
      case '5Y':
      case 'ALL':
        final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
        return '${months[date.month - 1]} ${date.year}';
      default:
        return '${date.month}/${date.day}';
    }
  }

  static String abbreviatedNumber(double value) {
    final absValue = value.abs();
    final sign = value < 0 ? '-' : '';
    
    if (absValue >= 1000000000) {
      final billions = absValue / 1000000000;
      if (billions >= 100) {
        return '$sign${billions.floor()}B';
      } else if (billions >= 10) {
        return '$sign${_floorToFixed(billions, 1)}B';
      } else {
        return '$sign${_floorToFixed(billions, 2)}B';
      }
    } else if (absValue >= 1000000) {
      final millions = absValue / 1000000;
      if (millions >= 100) {
        return '$sign${millions.floor()}M';
      } else if (millions >= 10) {
        return '$sign${_floorToFixed(millions, 1)}M';
      } else {
        return '$sign${_floorToFixed(millions, 2)}M';
      }
    } else if (absValue >= 1000) {
      final thousands = absValue / 1000;
      if (thousands >= 100) {
        return '$sign${thousands.floor()}k';
      } else if (thousands >= 10) {
        return '$sign${_floorToFixed(thousands, 1)}k';
      } else {
        return '$sign${_floorToFixed(thousands, 2)}k';
      }
    } else {
      if (absValue >= 100) {
        return '$sign${absValue.floor()}';
      } else if (absValue >= 10) {
        return '$sign${_floorToFixed(absValue, 1)}';
      } else {
        return '$sign${_floorToFixed(absValue, 2)}';
      }
    }
  }

  static String _floorToFixed(double value, int decimals) {
    final multiplier = pow(10, decimals);
    final floored = (value * multiplier).floor() / multiplier;
    return floored.toStringAsFixed(decimals);
  }
}
