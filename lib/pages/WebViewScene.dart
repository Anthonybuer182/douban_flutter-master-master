import 'package:douban_flutter/util/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:share/share.dart';
class WebViewScene extends StatefulWidget {
  final String url;
  final String title;

  WebViewScene({@required this.url, this.title});

  _WebViewSceneState createState() => _WebViewSceneState();
}

class _WebViewSceneState extends State<WebViewScene> {

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    Screen.updateStatusBarStyle(SystemUiOverlayStyle.light);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: this.widget.url,
      appBar: AppBar(
        elevation: 0,
        title: Text(this.widget.title ?? ''),
        leading: GestureDetector(
          onTap: back,
          child: Icon(Icons.arrow_back_ios),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Share.share(this.widget.url);
            },
            child: Container(
              margin: EdgeInsets.only(right: 15),
              child: Icon(Icons.share),
            ),
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
        child: const Center(
          //ios菊花进度条 等网页加载结束后消失
            child: CupertinoActivityIndicator()
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