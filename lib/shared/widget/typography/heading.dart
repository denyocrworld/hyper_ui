import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({
    required this.title,
    required this.titleFontSize,
    required this.subtitleFontSize,
    super.key,
    this.subtitle,
    this.onPressed,
    this.alternativeStyles = false,
  });
  final String title;
  final String? subtitle;
  final double titleFontSize;
  final double subtitleFontSize;
  final Function? onPressed;
  final bool alternativeStyles;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: alternativeStyles ? primaryColor.withOpacity(0.1) : null,
      ),
      padding: alternativeStyles
          ? const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 12,
            )
          : const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
                color: alternativeStyles ? primaryColor : null,
              ),
            ),
          ),
          if (subtitle != null)
            InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                if (onPressed != null) onPressed!();
              },
              child: Text(
                subtitle!,
                style: TextStyle(
                  fontSize: subtitleFontSize,
                  color: primaryColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

Widget H1({
  required String title,
  String? subtitle,
  Function? onPressed,
}) {
  return HeadingWidget(
    title: title,
    subtitle: subtitle,
    titleFontSize: 32,
    subtitleFontSize: 16,
    onPressed: onPressed,
  );
}

Widget H2({
  required String title,
  String? subtitle,
  Function? onPressed,
}) {
  return HeadingWidget(
    title: title,
    subtitle: subtitle,
    titleFontSize: 28,
    subtitleFontSize: 16,
    onPressed: onPressed,
  );
}

Widget H3({
  required String title,
  String? subtitle,
  Function? onPressed,
}) {
  return HeadingWidget(
    title: title,
    subtitle: subtitle,
    titleFontSize: 24,
    subtitleFontSize: 16,
    onPressed: onPressed,
  );
}

Widget H4({
  required String title,
  String? subtitle,
  Function? onPressed,
}) {
  return HeadingWidget(
    title: title,
    subtitle: subtitle,
    titleFontSize: 20,
    subtitleFontSize: 16,
    onPressed: onPressed,
  );
}

Widget H5({
  required String title,
  String? subtitle,
  Function? onPressed,
}) {
  return HeadingWidget(
    title: title,
    subtitle: subtitle,
    titleFontSize: 18,
    subtitleFontSize: 16,
    onPressed: onPressed,
  );
}

Widget H6({
  required String title,
  String? subtitle,
  Function? onPressed,
}) {
  return HeadingWidget(
    title: title,
    subtitle: subtitle,
    titleFontSize: 16,
    subtitleFontSize: 16,
    onPressed: onPressed,
  );
}

Widget HS1({
  required String title,
  String? subtitle,
  Function? onPressed,
}) {
  return HeadingWidget(
    title: title,
    subtitle: subtitle,
    titleFontSize: 30,
    subtitleFontSize: 14,
    onPressed: onPressed,
    alternativeStyles: true,
  );
}

Widget HS2({
  required String title,
  String? subtitle,
  Function? onPressed,
}) {
  return HeadingWidget(
    title: title,
    subtitle: subtitle,
    titleFontSize: 26,
    subtitleFontSize: 14,
    onPressed: onPressed,
    alternativeStyles: true,
  );
}

Widget HS3({
  required String title,
  String? subtitle,
  Function? onPressed,
}) {
  return HeadingWidget(
    title: title,
    subtitle: subtitle,
    titleFontSize: 22,
    subtitleFontSize: 14,
    onPressed: onPressed,
    alternativeStyles: true,
  );
}

Widget HS4({
  required String title,
  String? subtitle,
  Function? onPressed,
}) {
  return HeadingWidget(
    title: title,
    subtitle: subtitle,
    titleFontSize: 18,
    subtitleFontSize: 14,
    onPressed: onPressed,
    alternativeStyles: true,
  );
}

Widget HS5({
  required String title,
  String? subtitle,
  Function? onPressed,
}) {
  return HeadingWidget(
    title: title,
    subtitle: subtitle,
    titleFontSize: 16,
    subtitleFontSize: 14,
    onPressed: onPressed,
    alternativeStyles: true,
  );
}

Widget HS6({
  required String title,
  String? subtitle,
  Function? onPressed,
}) {
  return HeadingWidget(
    title: title,
    subtitle: subtitle,
    titleFontSize: 14,
    subtitleFontSize: 14,
    onPressed: onPressed,
    alternativeStyles: true,
  );
}
