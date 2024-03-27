import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class QCard extends StatelessWidget {
  const QCard({
    required this.children,
    super.key,
    this.title,
    this.subtitle,
    this.padding,
    this.actions = const [],
  });
  final String? title;
  final String? subtitle;
  final EdgeInsetsGeometry? padding;
  final List<Widget> children;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            12,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$title',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        if (subtitle != null)
                          Text(
                            '$subtitle',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (actions.isNotEmpty)
                    SizedBox(
                      height: 32,
                      child: Row(
                        children: actions,
                      ),
                    ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey[400],
              height: 1,
            ),
          ],
          Container(
            padding: padding ?? const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
