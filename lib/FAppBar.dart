import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:store_with_items/ficon_button.dart';
import 'package:sizer/sizer.dart';

class FAppBar extends SliverAppBar {
  // final PageData data;
  final BuildContext context;
  final bool isCollapsed;
  final double expandedHeight;
  final double collapsedHeight;
  final AutoScrollController scrollController;
  final TabController tabController;
  final void Function(bool isCollapsed) onCollapsed;
  final void Function(int index) onTap;

  FAppBar({
    // required this.data,
    required this.context,
    required this.isCollapsed,
    required this.expandedHeight,
    required this.collapsedHeight,
    required this.scrollController,
    required this.onCollapsed,
    required this.onTap,
    required this.tabController,
  }) : super(elevation: 4.0, pinned: true, forceElevated: true);

  final categories = ["Appetizers","Set Meals","Biriyani"];

  @override
  Color? get backgroundColor => Colors.white;

  @override
  Widget? get leading {
    return FIconButton(iconData: Icons.arrow_back, onPressed: () {});
  }

  @override
  List<Widget>? get actions {
    return [
      FIconButton(iconData: Icons.share_outlined, onPressed: () {}),
      FIconButton(iconData: Icons.info_outline, onPressed: () {}),
    ];
  }

  @override
  Widget? get title {
    print("isCollapsed ${this.isCollapsed}");
    var textTheme = Theme.of(context).textTheme;
    return AnimatedOpacity(
      opacity: this.isCollapsed ? 0 : 1,
      duration: const Duration(milliseconds: 250),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "App Title",
            // style: textTheme.subtitle1?.copyWith(color: Colors.amber),
            // strutStyle: Helper.buildStrutStyle(textTheme.subtitle1),
          ),
          const SizedBox(height: 4.0),
          Text(
            "40 mins",
            style: textTheme.caption?.copyWith(color: Colors.red),
            // strutStyle: Helper.buildStrutStyle(textTheme.caption),
          ),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? get bottom {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Container(
        color: Colors.white,
        child: TabBar(
          isScrollable: true,
          controller: tabController,
          // indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          indicatorColor: Colors.red,
          labelColor: Colors.red,
          unselectedLabelColor: Colors.grey,
          indicatorWeight: 3.0,
          tabs: categories.map((e) {
            return Tab(text: e);
          }).toList(),
          onTap: onTap,
        ),
      ),
    );
  }

  @override
  Widget? get flexibleSpace {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: LayoutBuilder(
        builder: (
          BuildContext context,
          BoxConstraints constraints,
        ) {
          // print("width : ${constraints.maxWidth}");
          final top = constraints.constrainHeight();
          final collapsedHeight = MediaQuery.of(context).viewPadding.top + 56 + 48;
          WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
            onCollapsed(collapsedHeight != top);
          });

      return FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Container(
          // width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top:70),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.topCenter,
          children: [
            Container(
              // width: 87.36.w,
              // height: 16.h,
              // width: 350,
                  // height: 150,
              // margin: EdgeInsets.only(top: 9.24.h, right: 5.2.w, left: 5.2.w),
              margin: EdgeInsets.only(top: 60, right: 30, left: 30,bottom: 60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: const Color(0xffffffff),
                                  // color: Colors.amberAccent,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 0),
                    blurRadius: 6,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  // width: 78.w,
                  // height: 13.68.h,
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1.0,
                        color: Color(0xFFDBDBDB)
                      ),
                    ]
                  ),
                  child: Hero(
                    // tag: store.id,
                    tag: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FadeInImage(
                        // width: 26.w,
                        // height: 18.h,
                        // width: 200,
                        // height: 100,
                        fit: BoxFit.cover,
                        // image: NetworkImage(
                        //     (store.imageUrl != null || store.imageUrl.isNotEmpty)
                        //         ? store.imageUrl
                        //         : 'https://via.placeholder.com/320x150'),
                        image: NetworkImage('https://via.placeholder.com/320x150'),
                        placeholder: AssetImage('assets/images/placeholder100x100.png'),
                        // imageErrorBuilder:  (BuildContext context, Object exception, StackTrace stackTrace){
                        //   return Container();
                        // },
                      ),
                    ),
                  ),
                ),
                Container(
                  // width: 86.85.w,
                  // height: 11.h,
                  width: 300,
                  height: 100,
                  // color: Colors.amber,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              // store.name,
                              "Store Name",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        // store.area,
                        "Potenga, Chittagong",
                        style: TextStyle(
                          
                          fontSize: 12,
                          color: const Color(0xff7e7e7e),
                          fontWeight: FontWeight.w400,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                      // Spacer(),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.timer,
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                // '${store.deliveryTime} mins',
                                "45 mins",
                                style: TextStyle(
                                  
                                  fontSize: 12,
                                  color: const Color(0xff7e7e7e),
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.timelapse,
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                // store.status == "closed" ? 'Opening in ${DateFormat.jm().format(DateTime.parse(now + " " +store.opensAt))}' : 'Closing in ${DateFormat.jm().format(DateTime.parse(now + " " +store.closesAt))}',
                                "Opening in 30 mins",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: const Color(0xff7e7e7e),
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          // if(store.storeLabel != null)
                           Container(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 1),
                            // height: 2.04.h,
                            // width: 22.1.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: const Color(0xffffd132),
                            ),
                            child: Text(
                              // store.storeLabel,
                              "Free Delivery",
                              style: TextStyle(
                                fontSize: 12,
                                color: const Color(0xff000000),
                                fontWeight: FontWeight.w300,
                              ),
                              textAlign: TextAlign.left,
                            ),
                                                   ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
          );
        },
      ),
    );
  }

}
