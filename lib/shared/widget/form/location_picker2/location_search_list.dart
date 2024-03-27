import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class LocationSearchListView extends StatefulWidget {
  const LocationSearchListView({
    super.key,
    this.value = '',
  });
  final String value;

  @override
  State<LocationSearchListView> createState() => _LocationSearchListViewState();
}

class _LocationSearchListViewState extends State<LocationSearchListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'.tr),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: const Column(),
        ),
      ),
    );
  }
}
