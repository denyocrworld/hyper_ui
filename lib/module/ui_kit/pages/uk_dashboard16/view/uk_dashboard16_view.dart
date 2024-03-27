import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/uk_dashboard16_controller.dart';

class UkDashboard16View extends StatefulWidget {
  const UkDashboard16View({Key? key}) : super(key: key);

  Widget build(context, UkDashboard16Controller controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("UkDashboard16"),
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
  State<UkDashboard16View> createState() => UkDashboard16Controller();
}
