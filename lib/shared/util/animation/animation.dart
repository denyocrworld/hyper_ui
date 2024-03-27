import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

extension WidgetAnimationExtension on Widget {
  Widget get am300 => animate()
      .move(
        duration: 300.ms,
      )
      .fadeIn(
        duration: 300.ms,
      );

  Widget get am400 => animate()
      .move(
        duration: 400.ms,
      )
      .fadeIn(
        duration: 400.ms,
      );

  Widget get am500 => animate()
      .move(
        duration: 500.ms,
      )
      .fadeIn(
        duration: 500.ms,
      );

  Widget get am600 => animate()
      .move(
        duration: 600.ms,
      )
      .fadeIn(
        duration: 600.ms,
      );

  Widget get am700 => animate()
      .move(
        duration: 700.ms,
      )
      .fadeIn(
        duration: 700.ms,
      );
  Widget get am800 => animate()
      .move(
        duration: 800.ms,
      )
      .fadeIn(
        duration: 800.ms,
      );
  Widget get am900 => animate()
      .move(
        duration: 900.ms,
      )
      .fadeIn(
        duration: 900.ms,
      );
  Widget get am1000 => animate()
      .move(
        duration: 1000.ms,
      )
      .fadeIn(
        duration: 1000.ms,
      );

  Widget get am => animate()
      .move(
        duration: 900.ms,
      )
      .fadeIn(
        duration: 900.ms,
      );
}

extension ColumnWidgetAnimationExtension on Column {
  Widget get amx {
    final children = this.children;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      key: key,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: List.generate(
        children.length,
        (index) {
          final child = children[index];
          final duration = 400 + (index * 200);
          return child
              .animate()
              .move(
                duration: duration.ms,
              )
              .shimmer(
                duration: (duration + 300).ms,
              )
              .fadeIn(
                duration: duration.ms,
              );
        },
      ),
    );
  }
}
