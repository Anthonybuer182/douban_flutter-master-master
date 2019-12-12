import 'package:douban_flutter/model/movie_news.dart';
import 'package:douban_flutter/net/api_client.dart';
import 'package:douban_flutter/util/MovieDataUtil.dart';
import 'package:douban_flutter/util/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MovieClassifyView.dart';
import 'MovieThreeGridView.dart';
import 'MovieTopScrollView.dart';
import 'home_news_banner_view.dart';
class HomePage extends StatefulWidget{
  @override
  _HomeState createState() =>_HomeState();

}
/**
 * AutomaticKeepAliveClientMixin需要用到页面保持状态，使他不销毁不重绘
 */
class _HomeState extends State<HomePage> with AutomaticKeepAliveClientMixin{
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
    if (nowPlayingList == null) {
      return new Center(
        //ios菊花进度条 等数据加载结束后消失
        child: new CupertinoActivityIndicator(
        ),
      );
    } else {
      return Container(
        //下拉刷新组件
          child: RefreshIndicator(
            color: AppColor.red,
            onRefresh: fetchData,
            child: ListView(
              //表示是否将列表项包裹在AutomaticKeepAlive中
              addAutomaticKeepAlives: true,
              // 防止 children 被重绘，设置预加载的区域
              cacheExtent: 10000,
              children: <Widget>[
                new NewsBannerView(newsList),
                new MovieThreeGridView(nowPlayingList, '影院热映', 'in_theaters'),
                new MovieThreeGridView(comingList, '即将上映', 'coming_soon'),
                new MovieTopScrollView(title: '电影榜单'),
                new MovieClassifyView(title: '分类浏览')
              ],
            ),
          )
      );
    }
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  // 加载数据
  Future<void> fetchData() async {
    ApiClient client = new ApiClient();
    List<MovieNews> news = await client.getNewsList();
    var nowPlayingData = await client.getNowPlayingList(start: 0, count: 6);
    var comingListData = await client.getComingList(start: 0, count: 6);
    setState(() {
      newsList =news2Banner(news);
      comingList = MovieDataUtil.getMovieList(comingListData);
      nowPlayingList = MovieDataUtil.getMovieList(nowPlayingData);
    });
  }

  /**
   * 构建新的banner实体
   */
  List<NewsBanner> news2Banner(var list) {
    List content = list;
    List<NewsBanner> banners = [];
    content.forEach((data) {
      banners.add(new NewsBanner(data));
    });
    return banners;
  }

}