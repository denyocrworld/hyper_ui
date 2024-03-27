import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';
import 'package:hyper_ui/shared/widget/form/searchfield/searchfield.dart';

class UkFormView extends StatefulWidget {
  UkFormView({Key? key}) : super(key: key);

  Widget build(context, UkFormController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: Text("CgHyperuiForm"),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () async {
                bool isValid = controller.formKey.currentState!.validate();
                if (isValid) {
                  return;
                }
              },
              child: Text("Validate"),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[300],
          padding: EdgeInsets.all(20.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SnippetHeader("Basic"),
                        QAutoComplete(
                          label: "Favorite employee",
                          validator: Validator.required,
                          items: [
                            {
                              "label": "Jackie Roo",
                              "value": "101",
                              "info": "Hacker",
                            },
                            {
                              "label": "Dan Milton",
                              "value": "102",
                              "info": "UI/UX Designer",
                            },
                            {
                              "label": "Ryper Roo",
                              "value": "103",
                              "info": "Android Developer",
                            }
                          ],
                          value: null,
                          onChanged: (value, label) {},
                        ),
                        SnippetContainer("q_searchfield"),
                        QSearchField(
                          label: "Search",
                          value: null,
                          prefixIcon: Icons.search,
                          suffixIcon: null,
                          onChanged: (value) {},
                          onSubmitted: (value) {},
                        ),
                        SnippetContainer("q_textfield"),
                        QTextField(
                          label: "Name",
                          validator: Validator.required,
                          value: null,
                          onChanged: (value) {},
                        ),
                        SnippetContainer("q_email"),
                        QTextField(
                          label: "Email",
                          validator: Validator.email,
                          suffixIcon: Icons.email,
                          value: null,
                          onChanged: (value) {},
                        ),
                        SnippetContainer("q_password"),
                        QTextField(
                          label: "Password",
                          obscure: true,
                          validator: Validator.required,
                          suffixIcon: Icons.password,
                          value: null,
                          onChanged: (value) {},
                        ),
                        SnippetHeader("Numberfield"),
                        SnippetContainer("q_numberfield"),
                        QNumberField(
                          label: "Age",
                          validator: Validator.required,
                          value: null,
                          onChanged: (value) {},
                        ),
                        SnippetContainer("q_moneyfield"),
                        QNumberField(
                          label: "Price 2",
                          validator: Validator.required,
                          value: "15000",
                          pattern: "#,###",
                          locale: "en_US",
                          onChanged: (value) {
                            print("Product price: $value");
                          },
                        ),
                        SnippetContainer("q_moneyfield_decimal"),
                        QNumberField(
                          label: "Price 3",
                          validator: Validator.required,
                          value: "23200.23",
                          pattern: "#,###.00",
                          onChanged: (value) {
                            print("Product price: $value");
                          },
                        ),
                        SnippetContainer("q_moneyfield_decimal_with_currency"),
                        QNumberField(
                          label: "Price 5",
                          validator: Validator.required,
                          value: "50000.45",
                          pattern: "\$#,###.00",
                          onChanged: (value) {
                            print("Product price: $value");
                          },
                        ),
                        SnippetHeader("Autocomplete"),
                        SnippetContainer("q_autocomplete"),
                        QAutoComplete(
                          label: "Favorite employee",
                          validator: Validator.required,
                          items: [
                            {
                              "label": "Jackie Roo",
                              "value": "101",
                              "info": "Hacker",
                            },
                            {
                              "label": "Dan Milton",
                              "value": "102",
                              "info": "UI/UX Designer",
                            },
                            {
                              "label": "Ryper Roo",
                              "value": "103",
                              "info": "Android Developer",
                            }
                          ],
                          value: null,
                          onChanged: (value, label) {},
                        ),
                        SnippetContainer("q_autocomplete_with_photo"),
                        QAutoComplete(
                          label: "Staff",
                          validator: Validator.required,
                          items: [
                            {
                              "photo":
                                  "https://i.ibb.co/MSM9Pmm/photo-1576570734316-e9d0317d7384-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                              "label": "Jessica Rin",
                              "value": 1,
                              "info": "Hacker",
                            },
                            {
                              "photo":
                                  "https://i.ibb.co/VM8w6SY/photo-1528813860492-bb99459ec095-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                              "label": "Jessica Dolf",
                              "value": 2,
                              "info": "UI/UX Designer",
                            },
                            {
                              "photo":
                                  "https://i.ibb.co/ckMm0Lq/photo-1576568699715-bae7154950c7-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                              "label": "Melisa Roo",
                              "value": 3,
                              "info": "Android Developer",
                            }
                          ],
                          value: null,
                          onChanged: (value, label) {},
                        ),
                        SnippetContainer("q_datefield"),
                        QDatePicker(
                          label: "Birth date",
                          validator: Validator.required,
                          value: null,
                          onChanged: (value) {
                            print("value: $value");
                          },
                        ),
                        SnippetContainer("q_timefield"),
                        QTimePicker(
                          label: "Working hour",
                          validator: Validator.required,
                          value: null,
                          onChanged: (value) {
                            print("value: $value");
                          },
                        ),
                        SnippetContainer("q_memofield"),
                        QMemoField(
                          label: "Address",
                          validator: Validator.required,
                          value: null,
                          onChanged: (value) {},
                        ),
                        SnippetContainer("q_dropdown"),
                        QDropdownField(
                          label: "Roles",
                          validator: Validator.required,
                          items: [
                            {
                              "label": "Admin",
                              "value": "Admin",
                            },
                            {
                              "label": "Staff",
                              "value": "Staff",
                            }
                          ],
                          value: "Admin",
                          onChanged: (value, label) {},
                        ),
                        SnippetContainer("q_check"),
                        QCheckField(
                          label: "Club",
                          validator: Validator.atLeastOneitem,
                          items: [
                            {
                              "label": "Persib",
                              "value": 101,
                              "checked": false,
                            },
                            {
                              "label": "Persikabo",
                              "value": 102,
                              "checked": true,
                            }
                          ],
                          onChanged: (values, ids) {},
                        ),
                        SnippetContainer("q_switch"),
                        QSwitch(
                          label: "Member",
                          validator: Validator.atLeastOneitem,
                          items: [
                            {
                              "label": "Private",
                              "value": 1,
                            },
                            {
                              "label": "Premium",
                              "value": 2,
                            }
                          ],
                          value: null,
                          onChanged: (values, ids) {},
                        ),
                        SnippetContainer("q_radio"),
                        QRadioField(
                          label: "Gender",
                          validator: Validator.atLeastOneitem,
                          items: [
                            {
                              "label": "Female",
                              "value": 1,
                            },
                            {
                              "label": "Male",
                              "value": 2,
                            }
                          ],
                          onChanged: (value, label) {},
                        ),
                        SnippetContainer("q_category_picker"),
                        QCategoryPicker(
                          label: "Category",
                          items: [
                            {
                              "label": "Main Course",
                              "value": "Main Course",
                            },
                            {
                              "label": "Drink",
                              "value": "Drink",
                            },
                            {
                              "label": "Snack",
                              "value": "Snack",
                            },
                            {
                              "label": "Dessert",
                              "value": "Dessert",
                            }
                          ],
                          validator: Validator.required,
                          onChanged: (index, label, value, item) {},
                        ),
                        SnippetContainer("q_tag_picker"),
                        QTagPicker(
                          items: [
                            {
                              "label": "Bed",
                              "value": "Bed",
                              "icon": Icons.bed,
                            },
                            {
                              "label": "Tables",
                              "value": "Tables",
                              "icon": Icons.table_bar,
                            },
                            {
                              "label": "Chairs",
                              "value": "Chairs",
                              "icon": Icons.chair,
                            },
                            {
                              "label": "Car wash",
                              "value": "Car wash",
                              "icon": Icons.local_car_wash,
                            },
                            {
                              "label": "Resturants",
                              "value": "Resturants",
                              "icon": Icons.restaurant,
                            },
                          ],
                          validator: Validator.required,
                          onChanged: (index, label, value, item) {},
                        ),
                        SnippetContainer("q_image_picker"),
                        QImagePicker(
                          label: "Photo",
                          validator: Validator.required,
                          value: null,
                          onChanged: (value) {},
                        ),
                        SnippetContainer("q_location_picker"),
                        QLocationPicker2(
                          label: "Location",
                          latitude: -6.218481065235333,
                          longitude: 106.80254435779423,
                          onChanged: (latitude, longitude, address) {},
                        ),
                        QLocationPicker2(
                          label: "Location",
                          onChanged: (latitude, longitude, address) {
                            print("latitude: $latitude");
                          },
                        ),
                        QRatingField(
                          label: "Rating",
                          value: 3,
                          onChanged: (value) {
                            showInfoDialog(value.toString());
                          },
                        ),
                        SnippetContainer("form_key"),
                        Text("""
          GlobalKey<FormState> formKey = GlobalKey<FormState>();
          """),
                        SnippetContainer("form_validate"),
                        Text("""
          bool isValid = formKey.currentState!.validate();
          if(isValid) {
            return;
          }
          """),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<UkFormView> createState() => UkFormController();
}
