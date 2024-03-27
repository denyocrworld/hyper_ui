import 'package:flutter/material.dart';
import 'package:hyper_ui/shared/theme/theme_config.dart';
import 'package:hyper_ui/shared/util/tap_handler/tap_handler.dart';

class QOutlineButton extends StatelessWidget {
  const QOutlineButton({
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
          foregroundColor: Colors.green,
          side: BorderSide(
            color: primaryColor,
            width: 2,
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
