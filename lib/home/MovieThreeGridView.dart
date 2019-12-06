import 'package:douban_flutter/model/MovieItem.dart';
import 'package:flutter/material.dart';
import 'HomeMovieCoverView.dart';
import 'HomeSectionView.dart';
import 'MovieComingView.dart';


class MovieThreeGridView extends StatelessWidget {
  final List<MovieItem> movies;
  final String title;
  final String action;

  MovieThreeGridView(this.movies, this.title, this.action);

  @override
  Widget build(BuildContext context) {
    var children;
    switch (title) {
      case '影院热映':
        print(movies.length);
        children = movies.map((movie) =>
            HomeMovieCoverView(movie)).toList();
        break;
      case '即将上映':
        children = movies.map((movie) =>
            MovieComingView(movie)).toList();
        break;
      default:
        break;
    }

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          HomeSectionView(title,action),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
            /**
             * Wrap按宽高自动换行布局
             * spacing主轴方向的间距 水平方向的间距
             * runSpacing run的间距 垂直方向的间距
             */
            child: Wrap(spacing: 15, runSpacing: 20, children: children,),
          ),
          Container(
            height: 10,
            color: Color(0xFFF5F5F5),
          )
        ],
      ),
    );
  }
}