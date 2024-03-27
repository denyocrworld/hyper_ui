import 'package:flutter/material.dart';

class QSwitch extends StatefulWidget {
  const QSwitch({
    required this.label,
    required this.items,
    required this.onChanged,
    super.key,
    this.validator,
    this.value,
    this.hint,
    this.helper,
  });
  final String label;
  final String? hint;
  final String? helper;
  final List<Map<String, dynamic>> items;
  final String? Function(List<Map<String, dynamic>> item)? validator;
  final List? value;
  final Function(List<Map<String, dynamic>> values, List ids) onChanged;

  @override
  State<QSwitch> createState() => _QSwitchState();
}

class _QSwitchState extends State<QSwitch> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    for (final item in widget.items) {
      items.add(Map.from(item));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: FormField(
        initialValue: false,
        validator: (value) => widget.validator!(items),
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
                final item = items[index];

                return SwitchListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text("${item["label"]}"),
                  value: item['checked'] ?? false,
                  onChanged: (val) {
                    items[index]['checked'] = val;
                    field.didChange(true);
                    setState(() {});

                    final selectedValues =
                        items.where((i) => i['checked'] == true).toList();

                    final ids = selectedValues.map((e) => e['value']).toList();
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
