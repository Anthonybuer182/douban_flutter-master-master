import 'package:douban_flutter/widget/HotSoonTabBar.dart';
import 'package:douban_flutter/widget/LoadingWidget.dart';
import 'package:douban_flutter/widget/TitleWidget.dart';
import 'package:douban_flutter/widget/TodayPlayMovieWidget.dart';
import 'package:flutter/material.dart';

///书影音-电影
///这个Widget整个布局较为复杂
///整个是使用CustomScrollView内存放各种Slivers构成
class MoviePage extends StatefulWidget {
  MoviePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MoviePageState();
  }
}

class _MoviePageState extends State<MoviePage>
    with AutomaticKeepAliveClientMixin {
  Widget titleWidget, hotSoonTabBarPadding;
  HotSoonTabBar hotSoonTabBar;
  var hotChildAspectRatio;
  var comingSoonChildAspectRatio;
  int selectIndex = 0; //选中的是热映、即将上映
  var itemW;
  var imgSize;
  List<String> todayUrls = ["https://ws1.sinaimg.cn/large/0065oQSqgy1fwyf0wr8hhj30ie0nhq6p.jpg","https://ws1.sinaimg.cn/large/0065oQSqgy1fxno2dvxusj30sf10nqcm.jpg","https://ws1.sinaimg.cn/large/0065oQSqgy1fy58bi1wlgj30sg10hguu.jpg","https://ww1.sinaimg.cn/large/0065oQSqly1g2hekfwnd7j30sg0x4djy.jpg"];
  Color weeklyTopColor, weeklyHotColor, weeklyTop250Color;
  Color todayPlayBg = Color.fromARGB(255, 47, 22, 74);

  @override
  void initState() {
    super.initState();
    print('initState movie_page');
    titleWidget = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: TitleWidget(),
    );

    hotSoonTabBar = HotSoonTabBar(
      onTabCallBack: (index) {
        setState(() {
          selectIndex = index;
        });
      },
    );

    hotSoonTabBarPadding = Padding(
      padding: EdgeInsets.only(top: 35.0, bottom: 15.0),
      child: hotSoonTabBar,
    );
  }

  @override
  Widget build(BuildContext context) {
    print('build movie_page');
    if (itemW == null || imgSize <= 0) {
      MediaQuery.of(context);
      var w = MediaQuery.of(context).size.width;
      imgSize = w / 5 * 3;
      itemW = (w - 30.0 - 20.0) / 3;
      hotChildAspectRatio = (377.0 / 674.0);
      comingSoonChildAspectRatio = (377.0 / 742.0);
    }
    return Stack(
      children: <Widget>[
        containerBody(),
        Offstage(
          child: LoadingWidget.getLoading(backgroundColor: Colors.transparent),
        )
      ],
    );
  }

  Widget containerBody() {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: titleWidget,
          ),
          SliverToBoxAdapter(
            child: Padding(
              child:
                  TodayPlayMovieWidget(todayUrls, backgroundColor: todayPlayBg),
              padding: EdgeInsets.only(top: 22.0),
            ),
          ),
          SliverToBoxAdapter(
            child: hotSoonTabBarPadding,
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
