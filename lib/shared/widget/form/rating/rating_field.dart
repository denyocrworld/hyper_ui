import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class QRatingField extends StatefulWidget {
  final String label;
  final double? value;
  final bool enabled;
  final String? Function(double?)? validator;
  final Function(double value)? onChanged;
  final String? hint;
  final String? helper;

  const QRatingField({
    Key? key,
    required this.label,
    this.value,
    this.onChanged,
    this.validator,
    this.enabled = false,
    this.hint,
    this.helper,
  }) : super(key: key);

  @override
  State<QRatingField> createState() => _QRatingFieldState();
}

class _QRatingFieldState extends State<QRatingField> {
  double? currentValue;
  GlobalKey widgetKey = GlobalKey();

  @override
  void initState() {
    currentValue = widget.value;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getHeight();
    });

    super.initState();
  }

  getHeight() {
    final RenderBox? renderBox =
        widgetKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final size = renderBox.size;
      setState(() {
        widgetHeight = size.height;
      });
    }
  }

  double widgetHeight = 0;
  @override
  Widget build(BuildContext context) {
    return FormField(
        initialValue: false,
        enabled: widget.enabled,
        validator: (value) {
          if (widget.validator != null) {
            return widget.validator!(currentValue);
          }
          return null;
        },
        builder: (field) {
          return Container(
            margin: const EdgeInsets.only(
              bottom: 12.0,
            ),
            child: Stack(
              children: [
                Container(
                  key: widgetKey,
                  child: TextFormField(
                    initialValue: " ",
                    decoration: InputDecoration(
                      labelText: widget.label,
                      helperText: widget.helper,
                      hintText: widget.hint,
                      errorText: field.errorText,
                    ),
                  ),
                ),
                Positioned(
                  left: Theme.of(context)
                          .inputDecorationTheme
                          .contentPadding
                          ?.horizontal ??
                      12.0,
                  top: 0,
                  right: 0,
                  child: Container(
                    height: widgetHeight,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          initialRating: widget.value ?? 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemSize: 20.0,
                          onRatingUpdate: (rating) {
                            currentValue = rating;
                            if (widget.onChanged != null) {
                              widget.onChanged!(rating);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
