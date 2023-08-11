import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class QOutlineSuccessButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double? width;
  QOutlineSuccessButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: 48,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: BorderSide(
            color: primaryColor,
          ),
        ),
        onPressed: () => onPressed(),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
