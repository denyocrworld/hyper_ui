import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class QButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double? width;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final Color? color;
  final bool spaceBetween;

  QButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
    this.prefixIcon,
    this.sufixIcon,
    this.color,
    this.spaceBetween = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: 46,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? primaryColor,
        ),
        onPressed: () => onPressed(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[
              Icon(
                prefixIcon!,
                size: 24.0,
              ),
              SizedBox(
                width: 6.0,
              ),
            ],
            if (spaceBetween && prefixIcon != null) Spacer(),
            Text(
              label,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            if (spaceBetween && sufixIcon != null) Spacer(),
            if (sufixIcon != null) ...[
              Icon(
                sufixIcon!,
                size: 24.0,
              ),
              SizedBox(
                width: 6.0,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
