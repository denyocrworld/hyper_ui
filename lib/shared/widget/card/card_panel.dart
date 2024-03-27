import 'package:flutter/material.dart';

class CardPanel extends StatelessWidget {
  const CardPanel({
    required this.children,
    super.key,
    this.padding,
  });
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: 12,
          ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300]!,
        ),
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
