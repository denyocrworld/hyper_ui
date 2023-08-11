import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class HeadingWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double titleFontSize;
  final double subtitleFontSize;
  final Function? onPressed;
  const HeadingWidget({
    Key? key,
    required this.title,
    required this.titleFontSize,
    required this.subtitleFontSize,
    this.subtitle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
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
