import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/favorite_controller.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({Key? key}) : super(key: key);

  Widget build(context, FavoriteController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<FavoriteView> createState() => FavoriteController();
}
