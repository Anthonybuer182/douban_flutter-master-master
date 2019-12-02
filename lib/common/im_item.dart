import 'package:flutter/material.dart';
import './touch_callback.dart';

//通用列表项
class ImItem extends StatelessWidget {
  //标题
  final String title;

  //图片路径
  final String imagePath;

  //图标
  final Icon icon;

  ImItem({Key key, @required this.title, this.imagePath, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TouchCallBack(
      onPressed: () {
        //判断点击的项
        switch (title) {
          case 'flutter官网':
            //路由到Flutter官网 动态页面
            Navigator.pushNamed(context, '/flutter');
            break;
          case 'flutter中文网':
            //路由到Flutter官网 动态页面
            Navigator.pushNamed(context, '/flutterChina');
            break;
          case 'flutter第三方依赖包':
            //路由到Flutter官网 动态页面
            Navigator.pushNamed(context, '/flutterDependences');
            break;
          case '清理缓存':
            showAlertDialog(context, "确认清理吗？");
            break;
          case '退出登录':
            showAlertDialog(context, "确认退出吗？");
            break;
        }
      },
      //展示部分
      child: Container(
        height: 50.0,
        child: Row(
          children: <Widget>[
            //图标或图片
            Container(
              child: imagePath != null
                  ? Image.asset(
                      imagePath,
                      width: 32.0,
                      height: 32.0,
                    )
                  : SizedBox(
                      height: 32.0,
                      width: 32.0,
                      child: icon,
                    ),
              margin: const EdgeInsets.only(left: 22.0, right: 20.0),
            ),
            //标题
            Text(
              title,
              style: TextStyle(fontSize: 16.0, color: Color(0xFF353535)),
            ),
          ],
        ),
      ),
    );
  }

  //对话框本质上是属于一个路由的页面route，由Navigator进行管理，所以控制对话框的显示和隐藏，也是调用Navigator.of(context)的push和pop方法
  void showAlertDialog(BuildContext context, String title) {
    showDialog(
        context: context,
        //是否可以通过点击屏障来关闭路由
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            //content: Text("确认退出吗?"),
            title: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            actions: <Widget>[
              //扁平按钮组件 点击时会有一个阴影效果
              FlatButton(
                onPressed: () {
                  //从导航器中弹出最上面的路由
                  Navigator.of(context).pop();
                },
                child: Text(
                  "确定",
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "取消",
                  style: TextStyle(color: Colors.lightBlue),
                ),
              )
            ],
          );
        });
  }
}
