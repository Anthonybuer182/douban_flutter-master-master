import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NetDemoState();
  }
}

class NetDemoState extends State<NetDemo> {
  var httpClient = new HttpClient();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    const uri = "http://gank.io/api/today";
    //httpClientPost(uri);
    httpPost(uri);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }

  // 要用async关键字异步请求
  void httpClientPost(String uri) async {
    print(httpClient);
    httpClient.getUrl(Uri.parse(uri)).then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      print(response.statusCode);
      if (response.statusCode == 200) {
        response.transform(utf8.decoder).join().then((String string) {
          print(string);
        });
      } else {
        print("error");
      }
    });
  }

  void httpPost(String url) {
    http.get(url).then((http.Response response) {
      print(response.statusCode);
      Map map=json.decode(response.body);
      print(map);
    });
  }
}
