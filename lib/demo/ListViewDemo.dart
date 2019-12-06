import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListViewState();
  }
}

class ListViewState extends State<ListViewDemo> {
  var list = ["a", "b", "c", "d"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      //
        body: ListView(
      children: <Widget>[
        ListView(
          // 高度会适配 item填充的内容的高度
          shrinkWrap: true,
          children: getDefaultList(),
        ),
        ListView(
          // 高度会适配 item填充的内容的高度
          shrinkWrap: true,
          children: getMyList(),
        ),
        getBuilderList()
      ],
    ));
  }

  getDefaultList() {
    return list.map((String f) {
      return ListTile(
        //是否默认3行高度，subtitle不为空时才能使用
        isThreeLine: true,
        //设置为true后字体变小
        dense: false,
        //左侧widge
        leading: new CircleAvatar(
          child: Text(f),
        ),
        title: Text('item的标题'),
        subtitle: Text('item的内容'),
        trailing: Icon(
          Icons.add,
          color: Colors.red,
        ),
      );
    }).toList();
  }

  //自定义ListTile
  getMyList() {
    return list.map((String f) {
      return Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/home"),
            ),
            Expanded(child: Container(padding:EdgeInsets.only(left:40),child: Text(f),)),
          ],
        ),
      );
    }).toList();
  }

  //使用Builder创建列表
  getBuilderList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(list[index],textAlign: TextAlign.center,);
        });
  }
}
