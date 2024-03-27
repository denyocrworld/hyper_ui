import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_dashboard13_view.dart';

class UkDashboard13Controller extends State<UkDashboard13View> {
  static late UkDashboard13Controller instance;
  late UkDashboard13View view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();
}
