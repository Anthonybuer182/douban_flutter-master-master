import 'package:douban_flutter/widget/FlutterTabBarView.dart';
import 'package:douban_flutter/widget/SearchTextFieldWidget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
var titleList = ['电影', '电视', '综艺', '读书', '音乐', '同城'];
List<Widget> tabList;
TabController _tabController;

class FriendsPage extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

//tab数据
class ItemView {
  const ItemView({this.title, this.icon});

  final String title;
  final IconData icon;
}

//选项卡类目
const List<ItemView> items = const <ItemView>[
  const ItemView(title: "好友", icon: Icons.directions),
  const ItemView(title: "黑名单", icon: Icons.directions)
];

class SelectedView extends StatelessWidget {
  const SelectedView({Key key, this.item}) : super(key: key);
  final ItemView item;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, //垂直方向最小化处理
        crossAxisAlignment: CrossAxisAlignment.center, //水平方向居中
        children: <Widget>[
          Icon(item.icon, size: 128.0, color: textStyle.color),
          Text(item.title, style: textStyle)
        ],
      ),
    );
  }
}

class _SplashState extends State<FriendsPage>
    with SingleTickerProviderStateMixin {
  var tabBar;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabBar = HomePageTabBar();
    tabList = getTabList();
    _tabController = TabController(vsync: this, length: tabList.length);
  }
  List<Widget> getTabList() {
    return titleList
        .map((item) => Text(
      '$item',
      style: TextStyle(fontSize: 18),
    ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: SafeArea(
          child: DefaultTabController(
              length: titleList.length, child: _getNestedScrollView(tabBar))),
    );
  }
}
Widget _getNestedScrollView(Widget tabBar) {
  String hintText = '用一部电影来形容你的2018';
  return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10.0),
              child: SearchTextFieldWidget(
                hintText: hintText,
                onTab: () {
                  //搜索页面
                },
              ),
            ),
          ),
          SliverPersistentHeader(
              floating: true,
              pinned: true,
              delegate: _SliverAppBarDelegate(
                  maxHeight: 49.0,
                  minHeight: 49.0,
                  child: Container(
                    color: Colors.white,
                    child: tabBar,
                  )))
        ];
      },
      body: FlutterTabBarView(
        tabController: _tabController,
      ));
}
class HomePageTabBar extends StatefulWidget {
  HomePageTabBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageTabBarState();
  }
}
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max((minHeight ?? kToolbarHeight), minExtent);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
class _HomePageTabBarState extends State<HomePageTabBar> {
  Color selectColor, unselectedColor;
  TextStyle selectStyle, unselectedStyle;

  @override
  void initState() {
    super.initState();
    selectColor = Colors.black;
    unselectedColor = Color.fromARGB(255, 117, 117, 117);
    selectStyle = TextStyle(fontSize: 18, color: selectColor);
    unselectedStyle = TextStyle(fontSize: 18, color: selectColor);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Tab小部件列表
//    List<Widget>  @required this.tabs,
    //组件选中以及动画的状态
//   TabController this.controller,
    //Tab是否可滑动(false->整个tab会把宽度填满，true-> tab包裹)
//  bool  this.isScrollable = false,
    //选项卡下方的导航条的颜色
//   Color this.indicatorColor,
    //选项卡下方的导航条的线条粗细
//   double this.indicatorWeight = 2.0,
//  EdgeInsetsGeometry  this.indicatorPadding = EdgeInsets.zero,
//   Decoration this.indicator,
//   TabBarIndicatorSize this.indicatorSize,导航条的长度，（tab：默认等分；label：跟标签长度一致）
//  Color  this.labelColor,所选标签标签的颜色
//  TextStyle  this.labelStyle,所选标签标签的文本样式
//  EdgeInsetsGeometry  this.labelPadding,,所选标签标签的内边距
// Color   this.unselectedLabelColor,未选定标签标签的颜色
//  TextStyle  this.unselectedLabelStyle,未选中标签标签的文字样式
//   void Function(T value) this.onTap,按下时的响应事件

    return Container(
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: TabBar(
        tabs: tabList,
        isScrollable: true,
        controller: _tabController,
        indicatorColor: selectColor,
        labelColor: selectColor,
        labelStyle: selectStyle,
        unselectedLabelColor: unselectedColor,
        unselectedLabelStyle: unselectedStyle,
        indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }
}