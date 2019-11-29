import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';

//加载页面
/**
 * StatefulWidget有状态组件 表示属性可变(即UI可刷新)
 * 实现需要两个类
 * StatefulWidget
 *State
 */
class SplashPage extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<SplashPage> {
//在 State 对象被插入视图树时调用。在 State 的生命周期中只会被调用一次，因此可以在 initState 函数中做一些初始化操作
  @override
  void initState(){
    super.initState();
    //在加载页面停顿3秒
    new Future.delayed(Duration(seconds: 3),(){
      //pushReplacementNamed()跳转之后不能再返回
      Navigator.of(context).pushReplacementNamed("LoginPage");
    });
  }

  @override
  Widget build(BuildContext context) {
    //在Center居中不居中，子元素处于水平和垂直方向的中间位置
    return new Center(
      //它可以使子组件堆叠起来，但是它比 FrameLayout 要强大，它可以控制子组件的位置
      child: Stack(
        children: <Widget>[
          //加载页面居中背景图  BoxFit.cover使显示可能拉伸，可能裁剪，充满
          Image.asset("assets/images/loading.jpeg",fit: BoxFit.cover,),
        ],
      ),
    );
  }

}