import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class DashboardView extends StatefulWidget {
  DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Badge(
                label: Text(
                  "6",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Icon(MdiIcons.chatQuestion),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Badge(
                label: Text(
                  "3",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: Icon(Icons.notifications),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            QCarousel(
              type: CarouselType.type4,
              images: [
                "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80",
                "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  QSearchField(
                    label: "Search",
                    value: null,
                    prefixIcon: Icons.search,
                    suffixIcon: null,
                    onChanged: (value) {},
                    onSubmitted: (value) {},
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  QGridMenu(
                    items: [
                      {
                        "label": "Product",
                        "icon": Icons.store,
                        "color": Colors.red,
                        "view": FavoriteView(),
                      },
                      {
                        "label": "Customer",
                        "icon": Icons.people,
                        "color": Colors.green,
                        "view": FavoriteView(),
                      },
                      {
                        "label": "Supplier",
                        "icon": Icons.emoji_people,
                        "color": Colors.blue,
                        "view": FavoriteView(),
                      },
                      {
                        "label": "User",
                        "icon": Icons.person,
                        "color": Colors.grey,
                        "view": FavoriteView(),
                      },
                      {
                        "label": "Report",
                        "icon": Icons.list_alt,
                        "color": Colors.purple,
                        "view": FavoriteView(),
                      },
                      {
                        "label": "Stock",
                        "icon": Icons.numbers,
                        "color": Colors.orange,
                        "view": FavoriteView(),
                      },
                      {
                        "label": "Export/Import",
                        "icon": Icons.import_contacts,
                        "color": Colors.blueAccent,
                        "view": FavoriteView(),
                      },
                      {
                        "label": "Backup/Restore",
                        "icon": Icons.backup,
                        "color": Colors.pink,
                        "view": FavoriteView(),
                      }
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
