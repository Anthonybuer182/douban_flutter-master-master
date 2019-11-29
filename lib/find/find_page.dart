import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();

}

class _SplashState extends State<FindPage> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: "文字",),
    Tab(text: "图片",),
    Tab(text: "视频",),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(length: items.length, child: Column(
      children: <Widget>[




      ],
    ));
  }
}

class ItemView {
  const ItemView({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<ItemView> items = const <ItemView>[
  const ItemView(title: "关注", icon: Icons.center_focus_strong),
  const ItemView(title: "推荐", icon: Icons.aspect_ratio),
  const ItemView(title: "文字", icon: Icons.textsms),
  const ItemView(title: "图片", icon: Icons.photo_size_select_actual),
  const ItemView(title: "视频", icon: Icons.video_label),
];

class SelectedView extends StatelessWidget {
  const SelectedView({Key key, this.item}) :super(key: key);
  final ItemView item;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .display1;
    // TODO: implement build
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(item.icon, size: 128, color: textStyle.color,),
            Text(item.title, style: textStyle),
          ],
        ),

      ),
    );
  }
}
