import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_dashboard19_view.dart';

class UkDashboard19Controller extends State<UkDashboard19View> {
  static late UkDashboard19Controller instance;
  late UkDashboard19View view;

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
