import 'package:flutter/material.dart';

class QOutlineDangerButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  final double? width;
  QOutlineDangerButton({
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
          foregroundColor: Colors.red,
          side: BorderSide(
            color: Colors.red,
          ),
        ),
        onPressed: () => onPressed(),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
