import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

class WebViewDemo extends StatefulWidget {
  final String title;
  final String url;

  WebViewDemo({this.title, this.url});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebViewState();
  }
}

class WebViewState extends State<WebViewDemo> {
  var httpClient = new HttpClient();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: WebviewScaffold(
        url: this.widget.url,
        appBar: AppBar(
          elevation: 0,
          title: Text(this.widget.title),
          leading: GestureDetector(
            onTap: back,
            child: Icon(Icons.arrow_back_ios),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () {

              },
              child: Icon(Icons.share),
            ),
          ],
        ),
        //是否缩放页面
        withZoom: true,
        //是否本地存储
        withLocalStorage: true,
        //默认状态隐藏
        hidden: true,
        initialChild: Container(
          child: Center(
            //ios菊花进度条 等网页加载结束后消失
            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    );
  }
  // 返回上个页面
  back() {
    print(this.widget.url);
    Navigator.pop(context);
  }
}
