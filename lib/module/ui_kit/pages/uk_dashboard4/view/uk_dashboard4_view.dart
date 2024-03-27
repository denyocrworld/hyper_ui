import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class UkDashboard4View extends StatefulWidget {
  UkDashboard4View({Key? key}) : super(key: key);

  Widget build(context, UkDashboard4Controller controller) {
    controller.view = this;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Feed",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Container(
                height: 44.0,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      6.0,
                    ),
                  ),
                ),
                child: Center(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                    decoration: InputDecoration.collapsed(
                      hintText: "Search",
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              SingleChildScrollView(
                controller: ScrollController(),
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                child: Row(
                  children: List.generate(controller.users.length, (index) {
                    var item = controller.users[index];
                    return Row(
                      children: [
                        if (index == 0) ...[
                          Container(
                            height: 100.0,
                            width: 72,
                            margin: EdgeInsets.only(
                              right: 12.0,
                            ),
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[900]!,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  8.0,
                                ),
                              ),
                            ),
                            child: Column(
                              children: [
                                Spacer(),
                                CircleAvatar(
                                  radius: 16.0,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.red,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "Add Story",
                                  style: TextStyle(
                                    fontSize: 10.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                        Container(
                          height: 100.0,
                          width: 72,
                          margin: EdgeInsets.only(
                            right: 12.0,
                          ),
                          padding: EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[900]!,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                8.0,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Spacer(),
                              CircleAvatar(
                                radius: 16.0,
                                backgroundImage: NetworkImage(
                                  item["photo"],
                                ),
                              ),
                              SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                item["name"],
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.usersStatus.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    var item = controller.usersStatus[index];
                    return Container(
                      margin: const EdgeInsets.only(
                        bottom: 20.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 14.0,
                                backgroundImage: NetworkImage(
                                  item["photo"],
                                ),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Text(
                                      item["name"],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.0,
                                    ),
                                    CircleAvatar(
                                      radius: 8.0,
                                      backgroundColor: Colors.green,
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 8.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                "2 min ago",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(
                                width: 4.0,
                              ),
                              Icon(
                                Icons.more_horiz,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            item["message"],
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "${controller.formatNumberToK(item["likes"])} likes",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Text(
                                "${item["comments"]} comments",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.favorite,
                                size: 20.0,
                                color: Colors.blueGrey[800]!,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Icon(
                                Icons.message,
                                size: 20.0,
                                color: Colors.blueGrey[800]!,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Icon(
                                Icons.share,
                                size: 20.0,
                                color: Colors.blueGrey[800]!,
                              ),
                            ],
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<UkDashboard4View> createState() => UkDashboard4Controller();
}
