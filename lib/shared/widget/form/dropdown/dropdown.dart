import 'package:flutter/material.dart';

class QDropdownField extends StatefulWidget {
  final String label;
  final String? hint;
  final String? helper;
  final List<Map<String, dynamic>> items;
  final String? Function(Map<String, dynamic>? value)? validator;
  final dynamic value;
  final bool emptyMode;
  final Function(dynamic value, String? label) onChanged;

  const QDropdownField({
    Key? key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
    this.emptyMode = true,
    this.hint,
    this.helper,
  }) : super(key: key);

  @override
  State<QDropdownField> createState() => _QDropdownFieldState();
}

class _QDropdownFieldState extends State<QDropdownField> {
  List<Map<String, dynamic>> items = [];
  Map<String, dynamic>? selectedValue;

  @override
  void initState() {
    super.initState();

    items = [];
    if (widget.emptyMode) {
      items.add({
        "label": "-",
        "value": "-",
      });
      selectedValue = {
        "label": "-",
        "value": "-",
      };
    }

    for (var item in widget.items) {
      items.add(item);
    }

    var values = widget.items.where((i) => i["value"] == widget.value).toList();
    if (values.isNotEmpty) {
      selectedValue = values.first;
    }
  }

  Map<String, dynamic>? get currentValue {
    if (widget.emptyMode) {
      var foundItems =
          items.where((i) => i["value"] == selectedValue?["value"]).toList();
      if (foundItems.isNotEmpty) {
        return foundItems.first;
      }

      return {
        "label": "-",
        "value": "-",
      };
    }
    return items.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12.0,
      ),
      child: FormField(
        initialValue: false,
        validator: (value) {
          if (widget.validator != null) {
            if (widget.emptyMode && selectedValue?["value"] == "-") {
              return widget.validator!(null);
            }
            return widget.validator!(selectedValue);
          }
          return null;
        },
        enabled: true,
        builder: (FormFieldState<bool> field) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: widget.label,
              errorText: field.errorText,
              helperText: widget.hint,
            ),
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: false,
                child: SizedBox(
                  height: 20.0,
                  child: DropdownButton<Map<String, dynamic>>(
                    isExpanded: true,
                    value: currentValue,
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.arrow_drop_down_outlined,
                        size: 24.0,
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                    ),
                    iconSize: 16,
                    elevation: 16,
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium!.fontSize,
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium!.fontFamily,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                    underline: Container(
                      height: 0,
                      color: Colors.grey[300],
                    ),
                    onChanged: (Map<String, dynamic>? newValue) {
                      if (widget.emptyMode && newValue?["value"] == "-") {
                        selectedValue = {
                          "label": "-",
                          "value": "-",
                        };
                      } else {
                        selectedValue = newValue!;
                      }
                      setState(() {});

                      var label = selectedValue!["label"];
                      var value = selectedValue!["value"];
                      widget.onChanged(value, label);
                    },
                    items: List.generate(
                      items.length,
                      (index) {
                        var item = items[index];
                        return DropdownMenuItem<Map<String, dynamic>>(
                          value: item,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 0.0,
                              vertical: 0.0,
                            ),
                            child: Text(
                              item["label"],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
