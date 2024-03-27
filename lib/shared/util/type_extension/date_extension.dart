import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get dMMMykkmm {
    return DateFormat('d MMM y kk:mm').format(toLocal().toLocal());
  }

  String get dMMMykkmmss {
    return DateFormat('d MMM y kk:mm:ss').format(toLocal().toLocal());
  }

  String get dMMMy {
    return DateFormat('d MMM y').format(toLocal().toLocal());
  }

  String get yMd {
    return DateFormat('y-MM-dd').format(toLocal().toLocal());
  }

  String get d {
    return DateFormat('d').format(toLocal().toLocal());
  }

  String get MMM {
    return DateFormat('MMM').format(toLocal().toLocal());
  }

  String get dMMM {
    return DateFormat('d MMM').format(toLocal().toLocal());
  }

  String get Y {
    return DateFormat('y').format(toLocal().toLocal());
  }

  String get kk {
    return DateFormat('kk').format(toLocal().toLocal());
  }

  String get mm {
    return DateFormat('mm').format(toLocal().toLocal());
  }

  String get ss {
    return DateFormat('ss').format(toLocal().toLocal());
  }

  String get kkmm {
    return DateFormat('kk:mm').format(toLocal().toLocal());
  }

  String get kkmmss {
    return DateFormat('kk:mm:ss').format(toLocal().toLocal());
  }

  bool isToday() {
    return toLocal().year == now.year &&
        toLocal().month == now.month &&
        toLocal().day == now.day;
  }

  bool isThisMonth() {
    return toLocal().year == now.year && toLocal().month == now.month;
  }

  bool isThisYear() {
    return toLocal().year == now.year;
  }

  bool isThisWeek() {
    final today = DateTime(now.year, now.month, now.day);
    final firstDayOfWeek = today.subtract(Duration(days: today.weekday - 1));
    final lastDayOfWeek = today.add(Duration(days: 7 - today.weekday));
    return toLocal()
            .isAfter(firstDayOfWeek.subtract(const Duration(days: 1))) &&
        toLocal().isBefore(lastDayOfWeek.add(const Duration(days: 1)));
  }
}

DateTime get now => DateTime.now().toLocal();
