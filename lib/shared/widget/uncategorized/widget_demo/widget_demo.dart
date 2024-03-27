import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class HUIWidgetDemoView extends StatefulWidget {
  const HUIWidgetDemoView({super.key});

  @override
  State<HUIWidgetDemoView> createState() => _HUIWidgetDemoViewState();
}

class _HUIWidgetDemoViewState extends State<HUIWidgetDemoView> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int? counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Demo'.tr),
        actions: [
          Container(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: () {
                final isValid = formKey.currentState!.validate();
                if (isValid) {
                  return;
                }
              },
              child: const Text('Check'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                QImagePicker(
                  label: 'Photo'.tr,
                  validator: Validator.required,
                  onChanged: (value) {},
                ),
                QTextField(
                  label: 'Name'.tr,
                  hint: 'Name',
                  validator: Validator.required,
                  value: 'John Doe',
                  onChanged: (value) {},
                ),
                QNumberField(
                  label: 'Age'.tr,
                  validator: Validator.required,
                  value: counter?.toString(),
                  onChanged: (value) {},
                ),
                QDropdownField(
                  label: 'Roles'.tr,
                  validator: Validator.required,
                  items: const [
                    {
                      'label': 'Admin',
                      'value': 1,
                    },
                    {
                      'label': 'Staff',
                      'value': 2,
                    }
                  ],
                  onChanged: (value, label) {},
                ),
                QCategoryPicker(
                  label: 'Category'.tr,
                  items: const [
                    {
                      'label': 'Main Course',
                      'value': 'Main Course',
                    },
                    {
                      'label': 'Drink',
                      'value': 'Drink',
                    },
                    {
                      'label': 'Snack',
                      'value': 'Snack',
                    },
                    {
                      'label': 'Dessert',
                      'value': 'Dessert',
                    }
                  ],
                  validator: Validator.required,
                  onChanged: (index, label, value, item) {},
                ),
                QRatingField(
                  label: 'Rating'.tr,
                  validator: Validator.required,
                  onChanged: (value) {},
                ),
                QLocationPicker2(
                  label: 'Location'.tr,
                  validator: Validator.required,
                  latitude: -6.218481065235333,
                  longitude: 106.80254435779423,
                  onChanged: (latitude, longitude, address) {},
                ),
                QAutoComplete(
                  label: 'Favorite employee'.tr,
                  hint: 'Your favorite Employee',
                  validator: Validator.required,
                  items: const [
                    {
                      'label': 'Jackie Roo',
                      'value': '101',
                      'info': 'Hacker',
                    },
                    {
                      'label': 'Dan Milton',
                      'value': '102',
                      'info': 'UI/UX Designer',
                    },
                    {
                      'label': 'Ryper Roo',
                      'value': '103',
                      'info': 'Android Developer',
                    }
                  ],
                  onChanged: (value, label) {},
                ),
                QTextField(
                  label: 'Name'.tr,
                  hint: 'Name',
                  validator: Validator.required,
                  onChanged: (value) {},
                ),
                QNumberField(
                  label: 'Age'.tr,
                  hint: "Your age's",
                  validator: Validator.required,
                  onChanged: (value) {},
                ),
                QDatePicker(
                  label: 'Birth date'.tr,
                  hint: 'Your birth date',
                  validator: Validator.required,
                  onChanged: (value) {
                    print('value: $value');
                  },
                ),
                QTimePicker(
                  label: 'Working hour'.tr,
                  hint: 'Your working hour',
                  validator: Validator.required,
                  onChanged: (value) {
                    print('value: $value');
                  },
                ),
                QMemoField(
                  label: 'Address'.tr,
                  hint: 'Your addresses',
                  validator: Validator.required,
                  value: 'Kamboja street 16, Bogor, West Java, Indonesia',
                  onChanged: (value) {},
                ),
                QCheckField(
                  label: 'Club'.tr,
                  validator: Validator.atLeastOneitem,
                  items: const [
                    {
                      'label': 'Persib',
                      'value': 101,
                      'checked': false,
                    },
                    {
                      'label': 'Persikabo',
                      'value': 102,
                      'checked': false,
                    }
                  ],
                  onChanged: (values, ids) {},
                ),
                QRadioField(
                  label: 'Gender'.tr,
                  hint: 'Gender',
                  validator: Validator.atLeastOneitem,
                  items: const [
                    {
                      'label': 'Female',
                      'value': 1,
                    },
                    {
                      'label': 'Male',
                      'value': 2,
                    }
                  ],
                  onChanged: (value, label) {},
                ),
                QSwitch(
                  label: 'Member'.tr,
                  validator: Validator.atLeastOneitem,
                  items: const [
                    {
                      'label': 'Private',
                      'value': 1,
                    },
                    {
                      'label': 'Premium',
                      'value': 2,
                    }
                  ],
                  onChanged: (values, ids) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
