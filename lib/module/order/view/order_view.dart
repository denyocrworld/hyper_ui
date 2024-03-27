import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import '../controller/order_controller.dart';

class OrderView extends StatefulWidget {
  const OrderView({Key? key}) : super(key: key);

  Widget build(context, OrderController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order"),
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
  State<OrderView> createState() => OrderController();
}
