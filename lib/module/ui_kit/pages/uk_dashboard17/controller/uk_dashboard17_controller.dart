import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_dashboard17_view.dart';

class UkDashboard17Controller extends State<UkDashboard17View> {
  static late UkDashboard17Controller instance;
  late UkDashboard17View view;

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
