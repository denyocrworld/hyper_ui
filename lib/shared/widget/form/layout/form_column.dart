import 'package:flutter/material.dart';

class FormColumn extends StatelessWidget {
  const FormColumn({
    required this.children,
    super.key,
    this.formKey,
    this.padding,
  });
  final List<Widget> children;
  final GlobalKey<FormState>? formKey;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: padding ?? const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
