import 'package:flutter/material.dart';

class MePage extends StatelessWidget {
  var parentContext;

  MePage(this.parentContext);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'LY',
      routes: <String, WidgetBuilder>{
//        "/routes":(BuildContext context) => new Routes(),
      },
      home: new MinePageWidget(parentContext),
    );
  }

  void greet(String message) {
    if (message != null) {}
  }
}

class MinePageWidget extends StatefulWidget {
  var parentContext;

  MinePageWidget(this.parentContext);

  _PageState createState() => _PageState();
}

class _PageState extends State<MinePageWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  void _requestData() async {}

  @override
  void initState() {
    super.initState();
    _requestData();
  }

  Widget _cell(int row, IconData iconData, String title, String describe,
      bool isShowBottomLine) {
    return GestureDetector(
      onTap: () {
        switch (row) {
          case 0:
            print("$row -- $title");
            break;
          case 1:
            print("$row -- $title");
            break;
          case 2:
            print("$row -- $title");
            break;
          case 3:
            print("$row -- $title");
            break;
          case 4:
            print("$row -- $title");
            break;
          case 5:
            print("$row -- $title");
            break;
          case 6:
            print("$row -- $title");
            break;
          case 7:
            showAlertDialog(context);
            print("$row -- $title");
            break;
        }
      },
      child: new Container(
        color: Colors.white,
        height: 50.0,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
                margin: new EdgeInsets.all(0.0),
                height: (isShowBottomLine ? 49.0 : 50.0),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Container(
                        margin: new EdgeInsets.only(left: 15.0),
                        child: new Row(
                          children: <Widget>[
                            new Icon(iconData, color: Colors.brown),
                            new Container(
                              margin: new EdgeInsets.only(left: 15.0),
                              child: new Text(title,
                                  style: TextStyle(
                                      color: Color(0xFF777777),
                                      fontSize: 16.0)),
                            )
                          ],
                        ),
                      ),
                      new Container(
                        child: new Row(
                          children: <Widget>[
                            new Text(describe,
                                style: TextStyle(
                                    color: Color(0xFFD5A670), fontSize: 14.0)),
                            new Icon(Icons.keyboard_arrow_right,
                                color: Color(0xFF777777)),
                          ],
                        ),
                      ),
                    ])),
            _bottomLine(isShowBottomLine),
          ],
        ),
      ),
    );
  }

  Widget _bottomLine(bool isShowBottomLine) {
    if (isShowBottomLine) {
      return new Container(
          margin: new EdgeInsets.all(0.0),
          child: new Divider(height: 1.0, color: Colors.black),
          padding: EdgeInsets.only(left: 15.0, right: 15.0));
    }
    return Container();
  }

  Widget _spaceView() {
    return Container(
      height: 10.0,
      color: Colors.black,
    );
  }

  Widget _topView(String name, String phone) {
    return new GestureDetector(
      onTap: () {
        print("修改头像、姓名、电话");
      },
      child: new Container(
        height: 180.0,
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            new Container(
              height: 40.0,
              width: 40.0,
              alignment: Alignment.center,
              margin: new EdgeInsets.only(right: 20.0, top: 10.0),
              child: new IconButton(
                  iconSize: 20.0,
                  icon: new Icon(Icons.new_releases, color: Colors.white),
                  onPressed: () {
                    print("查看消息");
                  }),
            ),
            new Container(
              height: 90.0,
              margin: new EdgeInsets.only(top: 20.0),
//              color: Colors.yellow,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Container(
                      padding: new EdgeInsets.only(left: 15.0),
                      child: new Card(
                        shape: new RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(new Radius.circular(35.0))),
                        child: new Image.asset(
                            "images/icon_tabbar_mine_normal.png",
                            height: 70.0,
                            width: 70.0),
                      )),
                  new Container(
                    margin: new EdgeInsets.only(left: 8.0, top: 25.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text("魏群",
                            style: TextStyle(
                                color: Color(0xFF777777), fontSize: 18.0),
                            textAlign: TextAlign.left),
                        new Text("18226717016",
                            style: TextStyle(
                                color: Color(0xFF555555), fontSize: 12.0),
                            textAlign: TextAlign.left)
                      ],
                    ),
                  ),
                  new Container(
                    child: new Icon(Icons.keyboard_arrow_right,
                        color: Color(0xFF777777)),
                    margin: new EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 2 - 15.0),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: new ListView.builder(
          physics: new AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == 0) {
              return _topView("阴天不尿尿", "13146218612");
            } else if (index == 1) {
              return _cell(index, Icons.list, "我的专属顾问", "", true);
            } else if (index == 2) {
              return _cell(index, Icons.card_membership, "银行卡", "", true);
            } else if (index == 3) {
              return _cell(index, Icons.title, "风险评测", "", false);
            } else if (index == 4) {
              return _spaceView();
            } else if (index == 5) {
              return _cell(index, Icons.help, "帮助说明", "", true);
            } else if (index == 6) {
              return _cell(index, Icons.settings, "设置", "", false);
            } else if (index == 7) {
              return _cell(index, Icons.exit_to_app, "退出登录", "", false);
            } else {
              return new Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.black,
              );
            }
          },
          itemCount: 7 + 1,
        ),
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            //content: Text("确认退出吗?"),
            title: Center(
              child: Text(
                "确认退出吗",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("确定"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("取消"),
              )
            ],
          );
        });
  }
}
