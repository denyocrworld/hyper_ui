import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class QActionButton extends StatelessWidget {
  final String label;
  final Function onPressed;
  const QActionButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = 20.0;
    final height = 46.0;

    return Container(
      padding: const EdgeInsets.all(padding),
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: height + (padding * 2),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
        ),
        onPressed: () => onPressed(),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
