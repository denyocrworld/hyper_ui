import 'package:flutter/material.dart';

class QCheckField extends StatefulWidget {
  const QCheckField({
    required this.label,
    required this.items,
    required this.onChanged,
    super.key,
    this.validator,
    this.value,
    this.onFuture,
    this.hint,
    this.helper,
    this.singleValue = false,
  });
  final String label;
  final String? hint;
  final List<Map<String, dynamic>> items;
  final String? Function(List<Map<String, dynamic>> item)? validator;
  final List? value;
  final Future<List<Map<String, dynamic>>> Function()? onFuture;
  final Function(List<Map<String, dynamic>> values, List ids) onChanged;
  final String? helper;
  final bool singleValue;

  @override
  State<QCheckField> createState() => _QCheckFieldState();
}

class _QCheckFieldState extends State<QCheckField> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    for (final item in widget.items) {
      items.add(Map.from(item));
    }

    if (widget.value != null) {
      for (final item in widget.value!) {
        final itemValue = item['value'];
        final index = items.indexWhere((i) => i['value'] == itemValue);
        if (index == -1) continue;
        items[index]['checked'] = item['checked'];
      }
    }
    loadItems();
  }

  setValue(List values) {
    for (final itemRow in values) {
      final searchValues =
          widget.items.where((i) => i['value'] == itemRow['value']).toList();
      if (searchValues.isEmpty) {
        items.add(itemRow);
      }
    }
    setState(() {});
  }

  getValue() {}

  Future<void> loadItems() async {
    if (widget.onFuture == null) return;

    final newItems = await widget.onFuture!();
    items = newItems;
    setState(() {});
  }

  uncheckAll() {
    if (widget.singleValue) {
      for (var index = 0; index < items.length; index++) {
        items[index]['checked'] = false;
      }
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
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = items[index];
                return CheckboxListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text("${item["label"]}"),
                  value: item['checked'] ?? false,
                  onChanged: (val) {
                    uncheckAll();
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
