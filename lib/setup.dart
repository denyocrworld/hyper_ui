import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && Platform.isWindows) return;
}
