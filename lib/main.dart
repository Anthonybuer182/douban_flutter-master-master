import 'dart:io';

import 'package:douban_flutter/pages/app_page.dart';
import 'package:douban_flutter/pages/demo_page.dart';
import 'package:douban_flutter/pages/login_page.dart';
import 'package:douban_flutter/pages/register_page.dart';
import 'package:douban_flutter/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//flutter 程序在运行的时候，第一个执行的函数就是main()函数
void main() {
  runApp(MyApp());
  //设置沉浸式状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor:Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

/**
 * StatelessWidget表示界面以后不刷新
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //页面主题色 appBar的主题色
        primarySwatch: Colors.yellow,
        //相关控件主题色例如TextFormField
        accentColor: Colors.yellow,
      ),
      //home对应的是应用程序首页
      home: SplashPage(),
      //添加页面跳转路由
      routes: {
        'LoginPage': (BuildContext context) => LoginPage(),
        'RegisterPage': (BuildContext context) => RegisterPage(),
        'AppPage': (BuildContext context) => AppPage(),
      },
    );
  }
}
