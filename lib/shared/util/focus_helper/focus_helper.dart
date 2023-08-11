import 'package:flutter/material.dart';

class FocusHelper {
  static void unfocus(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
