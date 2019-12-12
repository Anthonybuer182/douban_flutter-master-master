import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
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
  var dio = ApiClient.createDio();
  ///从豆瓣网页上获取需要的轮播图片
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
  /// 获取影院热映电影
  Future<dynamic> getNowPlayingList({int start, int count}) async {
    /**
     * in_theaters与baseUrl进行拼接
     * start和count是请求参数
     * subjects返回列表数据的key 如subjects: [{rating: {max: 10, average: 8.3...]
     */
    Response<Map> response = await dio.get('in_theaters', queryParameters: {"start":start, 'count':count});
    return response.data['subjects'];
  }

  /// 获取即将上映电影
  Future<dynamic> getComingList({int start, int count}) async {
    Response<Map> response = await dio.get('coming_soon', queryParameters: {"start":start, 'count':count});
    return response.data['subjects'];
  }
  // 获取本周口碑榜电影
  Future<dynamic> getWeeklyList() async {
    Response<Map> response = await dio.get('weekly');
    List content =response.data['subjects'];
    List movies = [];
    content.forEach((data) {
      movies.add(data['subject']);
    });
    return movies;
  }

  // 获取新片榜电影
  Future<dynamic> getNewMoviesList() async {
    Response<Map> response = await dio.get('new_movies');
    return response.data['subjects'];
  }

  // 获取北美票房榜电影
  Future<dynamic> getUsBoxList() async {
    Response<Map> response = await dio.get('us_box');
    List content =response.data['subjects'];
    List movies = [];
    content.forEach((data) {
      movies.add(data['subject']);
    });
    return movies;
  }

  // 获取 top250 榜单
  Future<dynamic> getTop250List({int start, int count}) async {
    Response<Map> response = await dio.get('top250', queryParameters: {'start':start, 'count':count});
    print(response.data);
    return response.data['subjects'];
  }
/// 获取电影详情
  Future<dynamic> getMovieDetail(String movieId) async {
    Response<Map> response = await dio.get('subject/$movieId');
    return response.data;
  }
  // 影片剧照
  Future<dynamic> getMovieAlbum({String movieId, int start, int count}) async {
    Response<Map> response = await dio.get('subject/$movieId/photos', queryParameters: {'start':start, 'count':count});
    return response.data['photos'];
  }

  // 演员详细信息
  Future<dynamic> getActorDetail(String actorId) async {
    Response<Map> response = await dio.get('celebrity/$actorId');
    return response.data;
  }


  // 获取演员相册
  Future<dynamic> getActorPhotos({String actorId, int start, int count}) async {
    Response<Map> response = await dio.get('celebrity/$actorId/photos', queryParameters: {'start':start, 'count':count});
    return response.data['photos'];
  }

  // 根据标签搜索
  Future<dynamic> getSearchListByTag({String tag, int start, int count}) async {
    Response<Map> response = await dio.get('search', queryParameters: {'tag':tag, 'start':start, 'count':count});
    print("http://api.douban.com/v2/movie/search?"+"tag&"+tag+"apikey&"+apiKey.toString()+"start&"+start.toString()+"count&"+count.toString());
    print(response.data);
    return response.data['subjects'];
  }
  ///配置请求参数
  static Dio createDio() {
    var options = BaseOptions(
      // 请求路径，如果 `path` 以 "http(s)"开始, 则 `baseURL` 会被忽略； 否则,
      //将会和baseUrl拼接出完整的的url.
        baseUrl: baseUrl,
        // 连接服务器超时时间，单位是毫秒.
        connectTimeout: 10000,
        //响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
        receiveTimeout: 10000,
        // 请求的Content-Type，默认值是[ContentType.JSON].
        //如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
        //可以设置此选项为 `ContentType.parse("application/x-www-form-urlencoded")`,  这样[Dio]
        //就会自动编码请求体.
        contentType: ContentType.json,
        //添加固定参数
        queryParameters: {
          "apikey":apiKey
        }
    );
    return Dio(options);
  }
}