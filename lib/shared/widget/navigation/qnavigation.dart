import 'dart:math';
import 'package:flutter/material.dart';

class NavigationMenu {
  NavigationMenu({
    required this.label,
    required this.icon,
    this.count = 0,
  });
  final String label;
  final IconData icon;
  final int count;
}

enum QNavigationMode {
  nav0,
  nav1,
  nav2,
  nav3,
  docked,
}

class QNavigation extends StatefulWidget {
  const QNavigation({
    required this.pages,
    required this.menus,
    super.key,
    this.initialIndex = 0,
    this.mode = QNavigationMode.nav0,
  });
  final List<Widget> pages;
  final List<NavigationMenu> menus;
  final QNavigationMode mode;
  final int initialIndex;
  @override
  State<QNavigation> createState() => QNavigationState();
}

class QNavigationState extends State<QNavigation> {
  static late QNavigationState instance;
  int selectedIndex = 0;

  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
    print(selectedIndex);
  }

  @override
  void initState() {
    super.initState();
    instance = this;
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    instance = this;
    double bottomBarHeight = 56;
    final pageCount = widget.pages.length;

    if (widget.mode == QNavigationMode.nav0) {
      return DefaultTabController(
        length: widget.pages.length,
        initialIndex: selectedIndex,
        child: Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: widget.pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: updateIndex,
            type: BottomNavigationBarType.fixed,
            items: List.generate(widget.menus.length, (index) {
              final item = widget.menus[index];
              return BottomNavigationBarItem(
                icon: Icon(
                  item.icon,
                ),
                label: item.label,
              );
            }),
          ),
        ),
      );
    }
    if (widget.mode == QNavigationMode.nav1) {
      return DefaultTabController(
        length: widget.pages.length,
        initialIndex: selectedIndex,
        child: Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: widget.pages,
          ),
          bottomNavigationBar: SizedBox(
            height: bottomBarHeight,
            child: BottomAppBar(
              padding: const EdgeInsets.all(0),
              shape: const CircularNotchedRectangle(),
              child: Container(
                height: bottomBarHeight,
                color: Colors.grey[900],
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      right: 30,
                      top: 0,
                      bottom: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(widget.menus.length, (index) {
                          final item = widget.menus[index];
                          final selected = index == selectedIndex;
                          if ((widget.menus.length / 2).floor() == index) {}
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white
                                  .withOpacity(selected ? 0.1 : 0.0),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: InkWell(
                              onTap: () => updateIndex(index),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    item.icon,
                                    size: 24,
                                    color: selected
                                        ? Colors.white
                                        : Colors.grey[700],
                                  ),
                                  if (selected)
                                    const SizedBox(
                                      width: 4,
                                    ),
                                  if (selected)
                                    AnimatedScale(
                                      duration:
                                          const Duration(milliseconds: 200),
                                      scale: selected ? 1.0 : 0.0,
                                      child: Text(
                                        item.label,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: selected
                                              ? Colors.white
                                              : Colors.grey[700],
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
    if (widget.mode == QNavigationMode.nav2) {
      return DefaultTabController(
        length: widget.pages.length,
        initialIndex: selectedIndex,
        child: Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: widget.pages,
          ),
          bottomNavigationBar: SizedBox(
            height: bottomBarHeight,
            child: BottomAppBar(
              padding: const EdgeInsets.all(0),
              shape: const CircularNotchedRectangle(),
              child: Container(
                child: Stack(
                  children: [
                    Positioned(
                      left: 12,
                      right: 12,
                      top: 0,
                      bottom: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(widget.menus.length, (index) {
                          final item = widget.menus[index];
                          final selected = index == selectedIndex;
                          if ((widget.menus.length / 2).floor() == index) {}

                          return Expanded(
                            child: InkWell(
                              onTap: () => updateIndex(index),
                              child: SizedBox(
                                height: bottomBarHeight,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      transform: Matrix4.translationValues(
                                        0,
                                        selected ? -20 : 10,
                                        0,
                                      ),
                                      margin: EdgeInsets.only(
                                        bottom: selected ? 6.0 : 0,
                                      ),
                                      child: AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        opacity: selected ? 0.0 : 1.0,
                                        child: Stack(
                                          children: [
                                            Icon(
                                              item.icon,
                                              color: selected
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Colors.grey[700],
                                              size: 24,
                                            ),
                                            if (item.count > 0)
                                              Positioned(
                                                right: 0,
                                                top: 0,
                                                child: Container(
                                                  transform:
                                                      Matrix4.translationValues(
                                                    4,
                                                    -4,
                                                    0,
                                                  ),
                                                  child: const Icon(
                                                    Icons.circle,
                                                    size: 10,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      transform: Matrix4.translationValues(
                                        0,
                                        selected ? -16 : 20,
                                        0,
                                      ),
                                      child: AnimatedOpacity(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        opacity: selected ? 1.0 : 0.0,
                                        child: Text(
                                          item.label,
                                          overflow: TextOverflow.ellipsis,
                                          key: Key('${Random().nextInt(1000)}'),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    if (widget.mode == QNavigationMode.nav3) {
      return DefaultTabController(
        length: widget.pages.length,
        initialIndex: selectedIndex,
        child: Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: widget.pages,
          ),
          bottomNavigationBar: SizedBox(
            height: bottomBarHeight,
            child: BottomAppBar(
              padding: const EdgeInsets.all(0),
              shape: const CircularNotchedRectangle(),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final mw = constraints.maxWidth - 40;
                  return SizedBox(
                    height: bottomBarHeight,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 200),
                          left: 20 + ((mw / pageCount) * selectedIndex),
                          bottom: 0,
                          child: Container(
                            width: mw / pageCount,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20,
                          right: 20,
                          top: 0,
                          bottom: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:
                                List.generate(widget.menus.length, (index) {
                              final item = widget.menus[index];
                              final selected = index == selectedIndex;
                              if ((widget.menus.length / 2).floor() == index) {}

                              return Expanded(
                                child: InkWell(
                                  onTap: () => updateIndex(index),
                                  child: SizedBox(
                                    height: bottomBarHeight,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 200),
                                          margin: EdgeInsets.only(
                                            bottom: selected ? 6.0 : 0,
                                          ),
                                          child: AnimatedScale(
                                            duration: const Duration(
                                                milliseconds: 200),
                                            scale: selected ? 1.2 : 1.0,
                                            child: Icon(
                                              item.icon,
                                              color: selected
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Colors.grey[700],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
    }

    if (widget.mode == QNavigationMode.docked) {
      return DefaultTabController(
        length: widget.pages.length,
        initialIndex: selectedIndex,
        child: Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: widget.pages,
          ),
          bottomNavigationBar: BottomAppBar(
            padding: const EdgeInsets.all(0),
            notchMargin: 8,
            shape: const CircularNotchedRectangle(),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SizedBox(
                  height: 58,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(widget.menus.length, (index) {
                      final item = widget.menus[index];
                      final selected = index == selectedIndex;
                      final middleIndex =
                          (widget.menus.length / 2).floor() - 1 == index;

                      double centerMargin = 30;

                      return Container(
                        width:
                            (constraints.maxWidth - centerMargin) / pageCount,
                        margin: EdgeInsets.only(
                          right: middleIndex ? centerMargin : 0,
                        ),
                        child: AnimatedScale(
                          duration: const Duration(milliseconds: 400),
                          scale: selected ? 1.2 : 1.0,
                          child: IconButton(
                            onPressed: () => updateIndex(index),
                            icon: Icon(
                              item.icon,
                              color: selected
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.4),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ),
          floatingActionButton: Container(
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {},
              child: const Icon(Icons.point_of_sale),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ),
      );
    }
    return Container();
  }
}
