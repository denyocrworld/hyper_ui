import 'package:flutter/material.dart';
import 'package:hyper_ui/shared/theme/theme_config.dart';

class QOutlineButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double? width;
  QOutlineButton({
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
          foregroundColor: Colors.green,
          side: BorderSide(
            color: primaryColor,
            width: 2.0,
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
