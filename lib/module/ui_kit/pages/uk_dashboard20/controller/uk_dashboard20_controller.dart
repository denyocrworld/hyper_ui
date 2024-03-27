import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_dashboard20_view.dart';

class UkDashboard20Controller extends State<UkDashboard20View> {
  static late UkDashboard20Controller instance;
  late UkDashboard20View view;

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
