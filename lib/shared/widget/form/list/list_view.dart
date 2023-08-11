import 'package:dio/dio.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class QListView extends StatefulWidget {
  static Map<String, QListViewState> instance = {};
  final String? id;
  final Function(int page) futureBuilder;
  final double? height;
  final double? padding;
  final Gradient? gradient;
  final Color? color;
  final Axis? scrollDirection;
  final bool wrapMode;
  final bool shrinkWrap;
  final double? bottomMargin;

  static reloadAll() async {
    for (var key in instance.keys) {
      instance[key]?.reload();
    }
  }

  final Function(int, Map) builder;
  const QListView({
    this.id,
    required this.builder,
    required this.futureBuilder,
    this.height,
    this.padding,
    this.gradient,
    this.color,
    this.scrollDirection,
    this.wrapMode = false,
    this.shrinkWrap = false,
    this.bottomMargin,
    Key? key,
  }) : super(key: key);

  @override
  State<QListView> createState() => QListViewState();
}

class QListViewState extends State<QListView> {
  bool loading = true;
  bool bottomLoading = false;
  Response? response;
  DioException? dioError;
  List<Map?> items = [];
  int page = 1;
  ScrollController scrollController = ScrollController();

  bool singleModeLoading = false;

  Future onLoading({
    bool nextPage = false,
  }) async {
    if (!mounted) return;
    if (!nextPage) {
      page = 1;
      items.clear();
      loading = true;
      setState(() {});
    } else {
      page++;
    }

    dioError = null;
    try {
      response = await widget.futureBuilder(page);
    } on DioException catch (_) {
      dioError = _;
      debugPrint("DioError: $_");
    } on Exception catch (_) {
      debugPrint("Exception: $_");
    }

    if (dioError != null || response == null) {
      loading = false;
      if (mounted) setState(() {});
      return;
    }

    Map responseMap = response?.data;
    List data = responseMap["data"];

    if (data.isEmpty) {
      page--;
    }

    for (var i = 0; i < data.length; i++) {
      var item = data[i];
      items.add(item);
    }

    loading = false;
    if (mounted) setState(() {});
  }

  initScrollController() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        onLoading(nextPage: true);
      }
    });
  }

  late String id;

  @override
  void initState() {
    super.initState();
    id = widget.id ?? const Uuid().v4();
    QListView.instance[id] = this;
    initScrollController();
    onLoading();
  }

  @override
  void dispose() {
    super.dispose();
    QListView.instance.remove(id);
    onLoading();
  }

  reload() async {
    if (mounted) {
      await onLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (widget.wrapMode) {
      return Wrap(
        children: List.generate(
          items.length,
          (index) {
            var item = (items[index] as Map);
            return widget.builder(index, item);
          },
        ),
      );
    }

    if (dioError != null) {
      return SizedBox(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Dio Error : ${dioError?.message}",
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text("Retry"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                onLoading();
              },
            ),
          ],
        ),
      );
    }

    if (response == null) {
      return SizedBox(
        height: widget.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Null response : ${response?.statusCode}",
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: const Text("Refresh"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: () {
                onLoading();
              },
            ),
          ],
        ),
      );
    }

    return Container(
      height: widget.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(widget.padding ?? 0.0),
      decoration: BoxDecoration(
        color: widget.color,
        gradient: widget.gradient,
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          await reload();
        },
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: ListView.builder(
            controller: scrollController,
            itemCount: items.length,
            shrinkWrap: widget.shrinkWrap,
            scrollDirection: widget.scrollDirection ?? Axis.vertical,
            itemBuilder: (context, index) {
              Map item = (items[index] as Map);
              return Container(
                margin: EdgeInsets.only(
                  bottom: widget.bottomMargin ?? 0.0,
                ),
                child: widget.builder(index, item),
              );
            },
          ),
        ),
      ),
    );
  }
}
