import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class UkNavigationView extends StatefulWidget {
  const UkNavigationView({Key? key}) : super(key: key);

  Widget build(context, UkNavigationController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("UkNavigation"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[300],
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: QNavigation(
                  mode: QNavigationMode.nav0,
                  pages: [
                    Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    Container(
                      color: Colors.green,
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                    Container(
                      color: Colors.purple,
                    ),
                  ],
                  menus: [
                    NavigationMenu(
                      icon: Icons.dashboard,
                      label: "Dashboard",
                    ),
                    NavigationMenu(
                      icon: Icons.list,
                      label: "Order",
                    ),
                    NavigationMenu(
                      icon: Icons.favorite,
                      label: "Favorite",
                    ),
                    NavigationMenu(
                      icon: Icons.person,
                      label: "Profile",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: QNavigation(
                  mode: QNavigationMode.nav1,
                  pages: [
                    Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    Container(
                      color: Colors.green,
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                    Container(
                      color: Colors.purple,
                    ),
                  ],
                  menus: [
                    NavigationMenu(
                      icon: Icons.dashboard,
                      label: "Dashboard",
                    ),
                    NavigationMenu(
                      icon: Icons.list,
                      label: "Order",
                    ),
                    NavigationMenu(
                      icon: Icons.favorite,
                      label: "Favorite",
                    ),
                    NavigationMenu(
                      icon: Icons.person,
                      label: "Profile",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: QNavigation(
                  mode: QNavigationMode.nav2,
                  pages: [
                    Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    Container(
                      color: Colors.green,
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                    Container(
                      color: Colors.purple,
                    ),
                  ],
                  menus: [
                    NavigationMenu(
                      icon: Icons.dashboard,
                      label: "Dashboard",
                    ),
                    NavigationMenu(
                      icon: Icons.list,
                      label: "Order",
                    ),
                    NavigationMenu(
                      icon: Icons.favorite,
                      label: "Favorite",
                    ),
                    NavigationMenu(
                      icon: Icons.person,
                      label: "Profile",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: QNavigation(
                  mode: QNavigationMode.nav3,
                  pages: [
                    Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    Container(
                      color: Colors.green,
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                    Container(
                      color: Colors.purple,
                    ),
                  ],
                  menus: [
                    NavigationMenu(
                      icon: Icons.dashboard,
                      label: "Dashboard",
                    ),
                    NavigationMenu(
                      icon: Icons.list,
                      label: "Order",
                    ),
                    NavigationMenu(
                      icon: Icons.favorite,
                      label: "Favorite",
                    ),
                    NavigationMenu(
                      icon: Icons.person,
                      label: "Profile",
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: QNavigation(
                  mode: QNavigationMode.docked,
                  pages: [
                    Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    Container(
                      color: Colors.green,
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                    Container(
                      color: Colors.purple,
                    ),
                  ],
                  menus: [
                    NavigationMenu(
                      icon: Icons.dashboard,
                      label: "Dashboard",
                    ),
                    NavigationMenu(
                      icon: Icons.list,
                      label: "Order",
                    ),
                    NavigationMenu(
                      icon: Icons.favorite,
                      label: "Favorite",
                    ),
                    NavigationMenu(
                      icon: Icons.person,
                      label: "Profile",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<UkNavigationView> createState() => UkNavigationController();
}
