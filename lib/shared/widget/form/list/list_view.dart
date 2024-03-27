import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class GorelaxListView extends StatefulWidget {
  const GorelaxListView({
    required this.builder,
    required this.futureBuilder,
    this.id,
    this.height,
    this.padding,
    this.gradient,
    this.color,
    this.scrollDirection,
    this.wrapMode = false,
    this.shrinkWrap = false,
    this.bottomMargin,
    this.onDismiss,
    super.key,
  });
  static Map<String, GorelaxListViewState> instance = {};
  final String? id;
  final Function(int page) futureBuilder;
  final Function(Map<String, dynamic> item)? onDismiss;
  final double? height;
  final double? padding;
  final Gradient? gradient;
  final Color? color;
  final Axis? scrollDirection;
  final bool wrapMode;
  final bool shrinkWrap;
  final double? bottomMargin;

  static reloadAll() async {
    for (final key in instance.keys) {
      instance[key]?.reload();
    }
  }

  final Function(int, Map<String, dynamic>) builder;

  @override
  State<GorelaxListView> createState() => GorelaxListViewState();
}

class GorelaxListViewState extends State<GorelaxListView> {
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
      if (mounted) setState(() {});
    } else {
      page++;
    }

    dioError = null;
    try {
      response = await widget.futureBuilder(page);
    } on DioException catch (_) {
      dioError = _;
      debugPrint('DioError: $_');
    } on Exception catch (_) {
      debugPrint('Exception: $_');
    }

    if (dioError != null || response == null) {
      loading = false;
      if (mounted) setState(() {});
      return;
    }

    final Map responseMap = response?.data;
    final List data = responseMap['data'];

    if (data.isEmpty) {
      page--;
    }

    for (var i = 0; i < data.length; i++) {
      final item = data[i];
      items.add(item);
    }

    loading = false;
    if (mounted) setState(() {});
  }

  initScrollController() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.hasClients) {
        if (scrollController.offset ==
            scrollController.position.maxScrollExtent) {
          onLoading(nextPage: true);
        }
      }
    });
  }

  late String id;

  @override
  void initState() {
    super.initState();
    id = widget.id ?? const Uuid().v4();
    GorelaxListView.instance[id] = this;
    initScrollController();
    onLoading();
  }

  @override
  void dispose() {
    super.dispose();
    GorelaxListView.instance.remove(id);
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
            final item = items[index]! as Map<String, dynamic>;

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dio Error : ${dioError?.message}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: Text(
                'Retry'.tr,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: onLoading,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Null response : ${response?.statusCode}',
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.refresh),
              label: Text(
                'Refresh'.tr,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
              ),
              onPressed: onLoading,
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
              final item = items[index]! as Map<String, dynamic>;

              if (widget.onDismiss != null) {
                return QDismissible(
                  onDismiss: () async {
                    await widget.onDismiss!(item);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: widget.bottomMargin ?? 0.0,
                    ),
                    child: widget.builder(index, item),
                  ),
                );
              }
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
