import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/uk_dashboard17_controller.dart';

class UkDashboard17View extends StatefulWidget {
  const UkDashboard17View({Key? key}) : super(key: key);

  Widget build(context, UkDashboard17Controller controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("UkDashboard17"),
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
  State<UkDashboard17View> createState() => UkDashboard17Controller();
}
