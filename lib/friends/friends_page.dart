import 'package:flutter/material.dart';

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

class _SplashState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new DefaultTabController(
          length: items.length,
          child: Scaffold(
             appBar: AppBar(
              // backgroundColor: Colors.yellow,
               title: TabBar(
                   tabs: items.map((ItemView item) {
                     return new Tab(text: item.title, icon: Icon(item.icon));
                   }).toList()),
             ),
             //添加视图卡
             body: TabBarView(
                 children: items.map((ItemView item) {
                   return Padding(
                     padding: const EdgeInsets.all(0),
                     child: SelectedView(item: item),
                   );
                 }).toList()),
          )),
    );
  }
}
