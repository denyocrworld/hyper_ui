import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class ExListView extends StatefulWidget {
  const ExListView({
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
    super.key,
  });
  static Map<String, ExListViewState> instance = {};
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
    for (final key in instance.keys) {
      instance[key]?.reload();
    }
  }

  final Function(int, Map) builder;

  @override
  State<ExListView> createState() => ExListViewState();
}

class ExListViewState extends State<ExListView> {
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
    print('onLoading?');
    if (!mounted) return;
    if (!nextPage) {
      page = 1;
      items.clear();
      loading = true;
      setState(() {});
    } else {
      page++;
    }
    print('onLoading...');

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
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        onLoading(nextPage: true);
      }
    });
  }

  late String id;

  @override
  void initState() {
    id = widget.id ?? const Uuid().v4();
    print('registered id: $id');
    ExListView.instance[id] = this;
    initScrollController();
    onLoading();
    super.initState();
  }

  @override
  void dispose() {
    ExListView.instance.remove(id);
    onLoading();
    super.dispose();
  }

  Future reload() async {
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
            final item = items[index]!;
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
              final item = items[index]!;
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
