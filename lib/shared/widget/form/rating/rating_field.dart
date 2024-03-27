import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class QRatingField extends StatefulWidget {
  const QRatingField({
    required this.label,
    super.key,
    this.value,
    this.onChanged,
    this.validator,
    this.enabled = false,
    this.hint,
    this.helper,
  });
  final String label;
  final double? value;
  final bool enabled;
  final String? Function(double?)? validator;
  final Function(double value)? onChanged;
  final String? hint;
  final String? helper;

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
    final renderBox =
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
            bottom: 12,
          ),
          child: Container(
            key: widgetKey,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: [
                    TextFormField(
                      initialValue: ' ',
                      decoration: InputDecoration(
                        labelText: widget.label,
                        helperText: widget.helper,
                        hintText: widget.hint,
                        errorText: field.errorText,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 13,
                          left: 20,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingBar.builder(
                              initialRating: widget.value ?? 0,
                              minRating: 1,
                              allowHalfRating: true,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemSize: 20,
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
                );
              },
            ),
          ),
        );
      },
    );
  }
}
