
import 'package:flutter/material.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:store_with_items/FAppBar.dart';
import 'package:store_with_items/category_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  final listViewKey = RectGetter.createGlobalKey();
  bool isCollapsed = false;
  late AutoScrollController scrollController;
  late TabController tabController;
  Map<int, dynamic> itemKeys = {};

  bool pauseRectGetterIndex = false;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    scrollController = AutoScrollController();
    super.initState();
  }

  void animateAndScrollTo(int index) {
    pauseRectGetterIndex = true;
    tabController.animateTo(index);
    scrollController.scrollToIndex(index, preferPosition: AutoScrollPosition.begin).then((value) => pauseRectGetterIndex = false);
  }

  void onCollapsed(bool value) {
    print("collapsed? $value");
    if (this.isCollapsed == value) return;
    setState(() => this.isCollapsed = value);
  }

  List<int> getVisibleItemsIndex() {
    Rect? rect = RectGetter.getRectFromKey(listViewKey);
    List<int> items = [];
    if (rect == null) return items;
    itemKeys.forEach((index, key) {
      Rect? itemRect = RectGetter.getRectFromKey(key);
      if (itemRect == null) return;
      if (itemRect.top > rect.bottom) return;
      if (itemRect.bottom < rect.top) return;
      items.add(index);
    });
    return items;
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (pauseRectGetterIndex) return true;
    int lastTabIndex = tabController.length - 1;
    List<int> visibleItems = getVisibleItemsIndex();

    bool reachLastTabIndex = visibleItems.isNotEmpty && visibleItems.length <= 2 && visibleItems.last == lastTabIndex;
    if (reachLastTabIndex) {
      tabController.animateTo(lastTabIndex);
    } else {
      int sumIndex = visibleItems.reduce((value, element) => value + element);
      int middleIndex = sumIndex ~/ visibleItems.length;
      if (tabController.index != middleIndex) tabController.animateTo(middleIndex);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: RectGetter(
        key: listViewKey,
        child: NotificationListener<ScrollNotification>(
          child: buildSliverScrollView(),
          onNotification: onScrollNotification,
        ),
      ),
    );
  }

    Widget buildSliverScrollView() {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        buildAppBar(),
        buildBody(),
      ],
    );
  }

  SliverAppBar buildAppBar() {
    return FAppBar(
      // data: data,
      context: context,
      scrollController: scrollController,
      expandedHeight: 300,
      collapsedHeight: 70,
      isCollapsed: isCollapsed,
      onCollapsed: onCollapsed,
      tabController: tabController,
      onTap: (index) => animateAndScrollTo(index),
    );
  }

    SliverList buildBody() {
    var categories = ["Appetizers","Set Meals","Biriyani"];
    return SliverList(
      delegate: SliverChildListDelegate(List.generate(
        categories.length,
        (index) {
          itemKeys[index] = RectGetter.createGlobalKey();
          return buildCategoryItem(index);
        },
      )),
    );
  }

  Widget buildCategoryItem(int index) {
    // Category category = data.categories[index];
    return RectGetter(
      key: itemKeys[index],
      child: AutoScrollTag(
        key: ValueKey(index),
        index: index,
        controller: scrollController,
        child: CategorySection(),
      ),
    );
  }
}