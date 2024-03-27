import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class QOutlineSuccessButton extends StatelessWidget {
  const QOutlineSuccessButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.width,
  });
  final String label;
  final Function onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: 48,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: BorderSide(
            color: primaryColor,
          ),
        ),
        onPressed: () {
          if (tapProtected) return;
          onPressed();
        },
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
