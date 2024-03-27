import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class QButton extends StatefulWidget {
  const QButton({
    required this.label,
    required this.onPressed,
    super.key,
    this.width,
    this.height,
    this.icon,
    this.sufixIcon,
    this.color,
    this.spaceBetween = false,
    this.size = ThemeSize.md,
    this.fontSize,
    this.enabled = true,
  });
  final String label;
  final Function onPressed;
  final double? width;
  final double? height;
  final IconData? icon;
  final IconData? sufixIcon;
  final Color? color;
  final bool spaceBetween;
  final ThemeSize size;
  final double? fontSize;
  final bool enabled;

  @override
  State<QButton> createState() => _QButtonState();
}

class _QButtonState extends State<QButton> {
  DateTime? lastTap;

  @override
  Widget build(BuildContext context) {
    var widgetWidth = widget.width ?? MediaQuery.of(context).size.width;
    var widgetHeight = 46.0;
    var widgetFontSize = 16.0;
    var widgetIconSize = 24.0;

    widgetWidth *= widget.size.scaleFactor;
    widgetHeight *= widget.size.scaleFactor;
    widgetFontSize *= widget.size.scaleFactor;
    widgetIconSize *= widget.size.scaleFactor;

    widgetHeight = widget.height ?? widgetHeight;

    return SizedBox(
      width: widgetWidth,
      height: widgetHeight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              widget.enabled ? (widget.color ?? primaryColor) : disabledColor,
        ),
        onPressed: () {
          if (tapProtected) return;
          widget.enabled ? widget.onPressed() : {};
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null) ...[
              Icon(
                widget.icon,
                size: widgetIconSize,
                color: Colors.white,
              ),
              const SizedBox(
                width: 6,
              ),
            ],
            if (widget.spaceBetween && widget.icon != null) const Spacer(),
            if (widget.icon == null)
              Expanded(
                child: Text(
                  widget.label,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: widget.fontSize ?? widgetFontSize,
                    color: Colors.white,
                  ),
                ),
              ),
            if (widget.icon != null)
              Text(
                widget.label,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: widget.fontSize ?? widgetFontSize,
                  color: Colors.white,
                ),
              ),
            if (widget.spaceBetween && widget.sufixIcon != null) const Spacer(),
            if (widget.sufixIcon != null) ...[
              Icon(
                widget.sufixIcon,
                size: widgetIconSize,
                color: Colors.white,
              ),
              const SizedBox(
                width: 6,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
