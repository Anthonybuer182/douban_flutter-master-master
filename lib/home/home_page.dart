import 'package:douban_flutter/model/movie_news.dart';
import 'package:douban_flutter/net/api_client.dart';
import 'package:douban_flutter/util/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home_news_banner_view.dart';
class HomePage extends StatefulWidget{
  @override
  _HomeState createState() =>_HomeState();

}
/**
 * AutomaticKeepAliveClientMixin需要用到页面保持状态，使他不销毁不重绘
 */
class _HomeState extends State<HomePage> with AutomaticKeepAliveClientMixin{
  int pageIndex = 0;
  var newsList;
  var nowPlayingList, comingList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
//    if (nowPlayingList == null) {
//      return new Center(
//        child: new CupertinoActivityIndicator(
//        ),
//      );
//    } else {
//      return Container(
//          child: RefreshIndicator(
//            color: AppColor.primary,
//            onRefresh: fetchData,
//            child: ListView(
//              addAutomaticKeepAlives: true,
//              // 防止 children 被重绘，
//              cacheExtent: 10000,
//              children: <Widget>[
//                new NewsBannerView(newsList),
//              ],
//            ),
//          )
//      );
//    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  // 加载数据
  Future<void> fetchData() async {
    ApiClient client = new ApiClient();
    List<MovieNews> news = await client.getNewsList();

    setState(() {
      newsList =news2Banner(news);
    });
  }
  List<NewsBanner> news2Banner(var list) {
    List content = list;
    List<NewsBanner> banners = [];
    content.forEach((data) {
      banners.add(new NewsBanner(data));
    });
    return banners;
  }

}