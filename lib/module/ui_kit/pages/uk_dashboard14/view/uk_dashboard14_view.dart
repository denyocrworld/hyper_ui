import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/uk_dashboard14_controller.dart';

class UkDashboard14View extends StatefulWidget {
  const UkDashboard14View({Key? key}) : super(key: key);

  Widget build(context, UkDashboard14Controller controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("UkDashboard14"),
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
  State<UkDashboard14View> createState() => UkDashboard14Controller();
}
