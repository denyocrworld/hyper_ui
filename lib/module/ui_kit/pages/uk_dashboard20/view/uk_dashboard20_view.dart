import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/uk_dashboard20_controller.dart';

class UkDashboard20View extends StatefulWidget {
  const UkDashboard20View({Key? key}) : super(key: key);

  Widget build(context, UkDashboard20Controller controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("UkDashboard20"),
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
  State<UkDashboard20View> createState() => UkDashboard20Controller();
}
