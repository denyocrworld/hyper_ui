import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/uk_dashboard15_controller.dart';

class UkDashboard15View extends StatefulWidget {
  const UkDashboard15View({Key? key}) : super(key: key);

  Widget build(context, UkDashboard15Controller controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("UkDashboard15"),
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
  State<UkDashboard15View> createState() => UkDashboard15Controller();
}
