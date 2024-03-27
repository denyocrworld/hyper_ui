import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class UkButtonView extends StatefulWidget {
  const UkButtonView({Key? key}) : super(key: key);

  Widget build(context, UkButtonController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("UkButton"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          constraints: BoxConstraints(
            maxWidth: 400.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              H6(title: "Basic Buttons"),
              const SnippetContainer("q_button_xs"),
              QButton(
                label: "xs",
                color: primaryColor,
                size: xs,
                onPressed: () {},
              ),
              const SnippetContainer("q_button_sm"),
              QButton(
                label: "sm",
                color: primaryColor,
                size: sm,
                onPressed: () {},
              ),
              const SnippetContainer("q_button_md"),
              QButton(
                label: "md",
                color: primaryColor,
                size: md,
                onPressed: () {},
              ),
              const SnippetContainer("q_button_lg"),
              QButton(
                label: "lg",
                color: primaryColor,
                size: lg,
                onPressed: () {},
              ),
              const SnippetContainer("q_button_xl"),
              QButton(
                label: "xl",
                color: primaryColor,
                size: xl,
                onPressed: () {},
              ),
              const SizedBox(
                height: 20.0,
              ),
              H6(title: "Button State"),
              const SizedBox(
                height: 20.0,
              ),
              const SnippetContainer("q_button_disabled"),
              Text("""
QButton(
  label: "Save",
  enabled: false, 
  onPressed: () {},
),
              """
                  .trim()),
              H6(title: "Action Buttons"),
              const SnippetContainer("qab"),
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Scaffold(
                  backgroundColor: Colors.grey[500],
                  bottomNavigationBar: QActionButton(
                    label: "Save",
                    onPressed: () {},
                  ),
                ),
              ),
              const SnippetContainer("qab_icon"),
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Scaffold(
                  backgroundColor: Colors.grey[500],
                  bottomNavigationBar: QActionButton(
                    label: "Save",
                    icon: Icons.save,
                    onPressed: () {},
                  ),
                ),
              ),
              const SnippetContainer("qab_buttons"),
              Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                child: Scaffold(
                  backgroundColor: Colors.grey[500],
                  bottomNavigationBar: Container(
                    padding: const EdgeInsets.all(12.0),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: QButton(
                            label: "Cancel",
                            color: disabledColor,
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Expanded(
                          child: QButton(
                            label: "Save",
                            color: primaryColor,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              H6(title: "Button Colors"),
              const SnippetContainer("q_button_primary"),
              QButton(
                label: "Primary",
                color: primaryColor,
                onPressed: () {},
              ),
              const SnippetContainer("q_button_secondary"),
              QButton(
                label: "Secondary",
                color: secondaryColor,
                onPressed: () {},
              ),
              const SnippetContainer("q_button_success"),
              QButton(
                label: "Success",
                color: successColor,
                onPressed: () {},
              ),
              const SnippetContainer("q_button_danger"),
              QButton(
                label: "Danger",
                color: dangerColor,
                onPressed: () {},
              ),
              const SnippetContainer("q_button_warning"),
              QButton(
                label: "Warning",
                color: warningColor,
                onPressed: () {},
              ),
              const SnippetContainer("q_button_info"),
              QButton(
                label: "Info",
                color: infoColor,
                onPressed: () {},
              ),
              const SnippetContainer("q_button_disabled"),
              QButton(
                label: "Disabled",
                color: disabledColor,
                onPressed: () {},
              ),
              Divider(),
              QButton(
                label: "Primary",
                icon: Icons.add,
                color: primaryColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Secondary",
                icon: Icons.add,
                color: secondaryColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Success",
                icon: Icons.add,
                color: successColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Danger",
                icon: Icons.add,
                color: dangerColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Warning",
                icon: Icons.add,
                color: warningColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Info",
                icon: Icons.add,
                color: infoColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Disabled",
                icon: Icons.add,
                color: disabledColor,
                onPressed: () {},
              ),
              Divider(),
              QButton(
                label: "Primary",
                sufixIcon: Icons.add,
                color: primaryColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Secondary",
                sufixIcon: Icons.add,
                color: secondaryColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Success",
                sufixIcon: Icons.add,
                color: successColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Danger",
                sufixIcon: Icons.add,
                color: dangerColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Warning",
                sufixIcon: Icons.add,
                color: warningColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Info",
                sufixIcon: Icons.add,
                color: infoColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Disabled",
                sufixIcon: Icons.add,
                color: disabledColor,
                onPressed: () {},
              ),
              Divider(),
              QButton(
                label: "Primary",
                icon: Icons.add,
                spaceBetween: true,
                color: primaryColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Secondary",
                icon: Icons.add,
                spaceBetween: true,
                color: secondaryColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Success",
                icon: Icons.add,
                spaceBetween: true,
                color: successColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Danger",
                icon: Icons.add,
                spaceBetween: true,
                color: dangerColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Warning",
                icon: Icons.add,
                spaceBetween: true,
                color: warningColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Info",
                icon: Icons.add,
                spaceBetween: true,
                color: infoColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Disabled",
                icon: Icons.add,
                spaceBetween: true,
                color: disabledColor,
                onPressed: () {},
              ),
              Divider(),
              QButton(
                label: "Primary",
                sufixIcon: Icons.add,
                spaceBetween: true,
                color: primaryColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Secondary",
                sufixIcon: Icons.add,
                spaceBetween: true,
                color: secondaryColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Success",
                sufixIcon: Icons.add,
                spaceBetween: true,
                color: successColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Danger",
                sufixIcon: Icons.add,
                spaceBetween: true,
                color: dangerColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Warning",
                sufixIcon: Icons.add,
                spaceBetween: true,
                color: warningColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Info",
                sufixIcon: Icons.add,
                spaceBetween: true,
                color: infoColor,
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              QButton(
                label: "Disabled",
                sufixIcon: Icons.add,
                spaceBetween: true,
                color: disabledColor,
                onPressed: () {},
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<UkButtonView> createState() => UkButtonController();
}
