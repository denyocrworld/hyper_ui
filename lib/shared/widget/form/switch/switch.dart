import 'package:flutter/material.dart';

class QSwitch extends StatefulWidget {
  final String label;
  final String? hint;
  final String? helper;
  final List<Map<String, dynamic>> items;
  final String? Function(List<Map<String, dynamic>> item)? validator;
  final List? value;
  final Function(List<Map<String, dynamic>> values, List ids) onChanged;

  const QSwitch({
    Key? key,
    required this.label,
    required this.items,
    this.validator,
    this.value,
    this.hint,
    this.helper,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<QSwitch> createState() => _QSwitchState();
}

class _QSwitchState extends State<QSwitch> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    for (var item in widget.items) {
      items.add(Map.from(item));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12.0,
      ),
      child: FormField(
        initialValue: false,
        validator: (value) => widget.validator!(items),
        enabled: true,
        builder: (FormFieldState<bool> field) {
          return InputDecorator(
            decoration: InputDecoration(
              labelText: widget.label,
              errorText: field.errorText,
              border: InputBorder.none,
              helperText: widget.helper,
              hintText: widget.hint,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                var item = items[index];

                return SwitchListTile(
                  title: Text("${item["label"]}"),
                  value: item["checked"] ?? false,
                  onChanged: (val) {
                    items[index]["checked"] = val;
                    field.didChange(true);
                    setState(() {});

                    List<Map<String, dynamic>> selectedValues =
                        items.where((i) => i["checked"] == true).toList();

                    List ids = selectedValues.map((e) => e["value"]).toList();
                    widget.onChanged(selectedValues, ids);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
