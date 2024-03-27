import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  String get kkmm {
    final hour = this.hour.toString().padLeft(2, '0');
    final time = minute.toString().padLeft(2, '0');
    return '$hour:$time';
  }
}
