import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_main_navigation_view.dart';

class UkMainNavigationController extends State<UkMainNavigationView> {
  static late UkMainNavigationController instance;
  late UkMainNavigationView view;

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
