import 'package:douban_flutter/model/MovieItem.dart';
import 'package:douban_flutter/net/api_client.dart';
import 'package:douban_flutter/util/MovieDataUtil.dart';
import 'package:douban_flutter/util/tag_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'HomeSectionView.dart';
import 'MovieClassiyItem.dart';

class MovieClassifyView extends StatefulWidget {

  final String title;

  const MovieClassifyView({Key key, this.title}) : super(key: key);

  @override
  _MovieClassifyViewState createState() => _MovieClassifyViewState();
}

class _MovieClassifyViewState extends State<MovieClassifyView> with AutomaticKeepAliveClientMixin<MovieClassifyView>{

  var classifyMovieList;
  var tagList;


  @override
  Widget build(BuildContext context) {
    if (classifyMovieList == null) {
      return CupertinoActivityIndicator();
    }
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HomeSectionView(this.widget.title, 'search'),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
            child: Column(
              children: <Widget>[
                MovieClassiyItem(tagList[0], classifyMovieList[0]),
                MovieClassiyItem(tagList[1], classifyMovieList[1]),
                MovieClassiyItem(tagList[2], classifyMovieList[2]),
              ],
            ),
          ),
          Container(
            height: 10,
            color: Color(0xFFF5F5F5),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // 加载数据
  Future<void> fetchData() async {
    ApiClient client = new ApiClient();
    // 获取标签
    List<String> tags = TagUtil.getRandomTag();
    List<List<MovieItem>> classifyMovies = [];
    List<MovieItem> classifyList = MovieDataUtil.getMovieList(await client.getTop250List(start:20,count:20));
    List<MovieItem> regionList = MovieDataUtil.getMovieList(await client.getTop250List(start:40,count:20));
    List<MovieItem> featureList = MovieDataUtil.getMovieList(await client.getTop250List(start:60,count:20));
    classifyMovies.addAll([classifyList, regionList, featureList]);
    setState(() {
      classifyMovieList = classifyMovies;
      tagList = tags;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
