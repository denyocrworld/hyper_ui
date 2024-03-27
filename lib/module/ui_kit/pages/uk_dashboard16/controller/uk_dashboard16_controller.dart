import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_dashboard16_view.dart';

class UkDashboard16Controller extends State<UkDashboard16View> {
  static late UkDashboard16Controller instance;
  late UkDashboard16View view;

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
