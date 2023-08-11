import 'dart:io';

import 'package:flutter/foundation.dart';

extension PlatformExtension on Platform {
  bool get isWindowsPlatform {
    return !kIsWeb && Platform.isWindows;
  }
}
