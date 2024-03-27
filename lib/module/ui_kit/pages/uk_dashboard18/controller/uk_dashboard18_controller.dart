import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_dashboard18_view.dart';

class UkDashboard18Controller extends State<UkDashboard18View> {
  static late UkDashboard18Controller instance;
  late UkDashboard18View view;

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
