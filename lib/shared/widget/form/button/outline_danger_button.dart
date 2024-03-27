import 'package:flutter/material.dart';
import 'package:hyper_ui/shared/util/tap_handler/tap_handler.dart';

class QOutlineDangerButton extends StatelessWidget {
  const QOutlineDangerButton({
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
          foregroundColor: Colors.red,
          side: const BorderSide(
            color: Colors.red,
          ),
        ),
        onPressed: () {
          if (tapProtected) return;
          onPressed();
        },
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
