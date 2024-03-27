import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/uk_carousel_view.dart';

class UkCarouselController extends State<UkCarouselView> {
  static late UkCarouselController instance;
  late UkCarouselView view;

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
