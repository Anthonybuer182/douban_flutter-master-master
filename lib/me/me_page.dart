import 'package:flutter/material.dart';
import '../common/touch_callback.dart';
import '../common/im_item.dart';

//我的页面
class MePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //列表
      body: ListView(
        children: <Widget>[
          //头像部分实现
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            height: 80.0,
            child: TouchCallBack(
              child: Row(
                //垂直方向居中对齐
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //添加头像
                  Container(
                    margin: const EdgeInsets.only(left: 12.0, right: 15.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/home.png'),
                      maxRadius: 30,
                    ),
                  ),
                  //用户名及帐号显示
                  Expanded(
                    child: Column(
                      //垂直方向居中对齐
                      mainAxisAlignment: MainAxisAlignment.center,
                      //水平方向居中对齐
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'DoctorWei',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xFF353535),
                          ),
                        ),
                        Text(
                          '邮箱: 1348172474@qq.com',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFFa9a9a9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //二维码图片显示
                  Container(
                    margin: const EdgeInsets.only(left: 12.0, right: 15.0),
                    child: Image.asset(
                      'assets/images/code.png',
                      width: 24.0,
                      height: 24.0,
                    ),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
          //列表项 使用ImItem渲染
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: ImItem(
              title: 'flutter官网',
              imagePath: 'assets/images/icon_me_friends.png',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ImItem(
                  imagePath: 'assets/images/icon_me_message.png',
                  title: 'flutter中文网',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),
                ),
                ImItem(
                  imagePath: 'assets/images/icon_me_photo.png',
                  title: 'flutter第三方依赖包',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),
                ),
                ImItem(
                  imagePath: 'assets/images/icon_me_file.png',
                  title: '我的文件',
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Divider(
                    height: 0.5,
                    color: Color(0xFFd9d9d9),
                  ),
                ),
                ImItem(
                  imagePath: 'assets/images/icon_me_service.png',
                  title: '联系客服',
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            color: Colors.white,
            child: ImItem(
              title: '清理缓存',
              imagePath: 'assets/images/icon_me_clear.png',
            ),
          ),
           Container(
              margin: const EdgeInsets.only(top: 20.0),
              color: Colors.white,
              child: ImItem(
                title: '退出登录',
                imagePath: 'assets/images/ic_arrow_back.png',
              ),
            ),
        ],
      ),
    );
  }


}
