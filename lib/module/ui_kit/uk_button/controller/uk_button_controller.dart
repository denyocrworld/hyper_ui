import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_button_view.dart';

class UkButtonController extends State<UkButtonView> {
  static late UkButtonController instance;
  late UkButtonView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
