import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_dashboard15_view.dart';

class UkDashboard15Controller extends State<UkDashboard15View> {
  static late UkDashboard15Controller instance;
  late UkDashboard15View view;

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
