import 'package:flutter/material.dart';

class QCheckField extends StatefulWidget {
  final String label;
  final String? hint;
  final List<Map<String, dynamic>> items;
  final String? Function(List<Map<String, dynamic>> item)? validator;
  final List? value;
  final Future<List<Map<String, dynamic>>> Function()? onFuture;
  final Function(List<Map<String, dynamic>> values, List ids) onChanged;
  final String? helper;

  const QCheckField({
    Key? key,
    required this.label,
    required this.items,
    this.validator,
    this.value,
    this.onFuture,
    this.hint,
    this.helper,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<QCheckField> createState() => _QCheckFieldState();
}

class _QCheckFieldState extends State<QCheckField> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    for (var item in widget.items) {
      items.add(Map.from(item));
    }
    loadItems();
  }

  setValue(List values) {
    for (var itemRow in values) {
      var searchValues =
          widget.items.where((i) => i["value"] == itemRow["value"]).toList();
      if (searchValues.isEmpty) {
        items.add(itemRow);
      }
    }
    setState(() {});
  }

  getValue() {}

  loadItems() async {
    if (widget.onFuture == null) return;

    List<Map<String, dynamic>> newItems = await widget.onFuture!();
    items = newItems;
    setState(() {});
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
                return CheckboxListTile(
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
