import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class QActionButtonWithOptions extends StatelessWidget {
  const QActionButtonWithOptions({
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.onOptionPressed,
    super.key,
  });
  final String label;
  final IconData icon;
  final Function onPressed;
  final Function onOptionPressed;

  @override
  Widget build(BuildContext context) {
    const padding = 20.0;
    return Container(
      padding: const EdgeInsets.all(padding),
      height: 48 + (padding * 2),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                onPressed: () => onPressed(),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: 68,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffe8e8e8),
                foregroundColor: const Color(0xff545d58),
              ),
              onPressed: () {
                if (tapProtected) return;
                onOptionPressed();
              },
              child: Icon(
                icon,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
