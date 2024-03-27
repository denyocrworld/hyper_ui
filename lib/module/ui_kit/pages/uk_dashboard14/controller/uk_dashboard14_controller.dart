import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_dashboard14_view.dart';

class UkDashboard14Controller extends State<UkDashboard14View> {
  static late UkDashboard14Controller instance;
  late UkDashboard14View view;

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
