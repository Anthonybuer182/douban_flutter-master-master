//import 'package:cached_network_image/cached_network_image.dart';
import 'package:douban_flutter/model/movie_news.dart';
import 'package:douban_flutter/util/AppNavigator.dart';
import 'package:douban_flutter/util/app_color.dart';
import 'package:douban_flutter/util/screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NewsBannerView extends StatelessWidget {
  final List<NewsBanner> banners;

  NewsBannerView(this.banners);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      //轮播图
      child: CarouselSlider(
        //
        items: banners.map((banner) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () {
                  //点击tab按键
                  AppNavigator.pushWeb(context, banner.news.link,banner.news.title);
                },
                child: Container(
                    width: Screen.width,
                    //可以指定垂直和水平方向的边距,也可以单独指定垂直或者水平方向的边距
                    margin:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: Screen.width,
                          //边框装饰器有边框、圆角、阴影、形状、渐变、背景图像
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(banner.news.cover),
                                //后期可添加缓存
                                //image: CachedNetworkImageProvider(banner.news.cover),
                                fit: BoxFit.cover,
                              ),
                              //圆角
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                        ),
                        ////通过Opacity的透明度值来控制 widget显示和隐藏 这比在树中删除和添加widget效率更高
                        Opacity(
                          //透明度值越小越透明
                          opacity: 0.1,
                          child: Container(
                            width: Screen.width,
                            decoration: BoxDecoration(
                              //以黑色为基准设置透明度
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(20),
                          width: Screen.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                banner.news.title,
                                style: TextStyle(
                                  color: AppColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(banner.news.summary,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: AppColor.white,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    )),
              );
            },
          );
        }).toList(),
        //宽高比例，默认为`16/9`
        aspectRatio: 2,
        //自动播放
        autoPlay: true,
        //播放间隔时间
        autoPlayInterval: const Duration(seconds: 5),
        //扩大中间页面
        enlargeCenterPage: true,
      ),
    );
  }
}

class NewsBanner {
  MovieNews news;

  NewsBanner(this.news);
}
