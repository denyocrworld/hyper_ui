import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../view/favorite_view.dart';

class FavoriteController extends State<FavoriteView> {
  static late FavoriteController instance;
  late FavoriteView view;

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
