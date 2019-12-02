import 'dart:async';
import 'package:douban_flutter/model/movie_news.dart';
import 'package:html/dom.dart' as dom;
//show关键字表示只引用一点
import 'package:html/parser.dart' show parse;
//as指定固定前缀
import 'package:http/http.dart' as http;
class ApiClient {
  static const String baseUrl = 'http://api.douban.com/v2/movie/';
  static const String apiKey = '0b2bdeda43b5688921839c8ecb20399b';
  static const String webUrl = 'https://movie.douban.com/';
  //从豆瓣网页上获取需要的轮播图片
  Future<List<MovieNews>> getNewsList() async{
    //获取的轮播图信息列表
    List<MovieNews> news = [];
    await http.get(webUrl).then((http.Response response){
        var document = parse(response.body.toString());
        // 获取所有指定类名的元素gallery-frame获取轮播图数据
        List<dom.Element> items = document.getElementsByClassName('gallery-frame');
        items.forEach((item) {
          String cover = item.getElementsByTagName('img')[0].attributes['src'].toString();//根据网页<img/>便签获取图片
          String link = item.getElementsByTagName('a')[0].attributes['href'].toString();//根据网页<a/>标签获取链接
          String title = item.getElementsByTagName('h3')[0].text.toString().trim();//根据网页<h3/>标签获取标题
          String summary =item.getElementsByTagName('p')[0].text.toString().trim();//根据网页<p/>标签获取段落
          MovieNews movieNews = new MovieNews(title, cover, summary, link);
          news.add(movieNews);
        });
    });
    return news;
  }
}