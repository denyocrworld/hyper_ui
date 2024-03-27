import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_navigation_view.dart';

class UkNavigationController extends State<UkNavigationView> {
  static late UkNavigationController instance;
  late UkNavigationView view;

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
