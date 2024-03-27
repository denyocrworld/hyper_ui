import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    required this.label,
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.color,
  });
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {},
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        child: Row(
          children: [
            if (prefixIcon != null) ...[
              Icon(
                prefixIcon,
                size: 20,
                color: color,
              ),
              const SizedBox(
                width: 12,
              ),
            ],
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: color,
                ),
              ),
            ),
            if (suffixIcon != null) ...[
              const SizedBox(
                width: 8,
              ),
              Icon(
                suffixIcon,
                size: 24,
              ),
            ],
            if (suffixIcon == null) ...[
              const SizedBox(
                width: 12,
              ),
              Icon(
                Icons.chevron_right,
                size: 20,
                color: color,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
