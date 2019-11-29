import 'dart:io';
import 'package:douban_flutter/find/find_page.dart';
import 'package:douban_flutter/friends/friends_page.dart';
import 'package:douban_flutter/home/home_page.dart';
import 'package:douban_flutter/me/me_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///首页
class AppPage extends StatefulWidget  {
  @override
  _SplashWidgetState createState() {
    return _SplashWidgetState();
  }
}

class _SplashWidgetState extends State<AppPage> {
  //标记底部导航栏选中的位置
  int _selectIndex = 0;
  //可选命名参数 需要指定下对应的参数名
  _popupMenuItem(String title, {String imagePath, IconData icon}) {
    //单个值的弹出菜单项
    return PopupMenuItem(
      //Row水平布局对child 在水平方向进行排列
      child: Row(
        children: <Widget>[
          imagePath != null
              ? Image.asset(
                  imagePath,
                  width: 32.0,
                  height: 32.0,
                )
              : SizedBox(
                  width: 32.0,
                  height: 32.0,
                  //Icon是 Flutter 的图标类，它集成了 Material 风格的图标。它有几个衍生的组件：ImageIcon、IconButton 等
                  child: Icon(icon, color: Colors.white),
                ),
          Container(
            //可以设置具体某个方向的补白(可以同时指定多个方向)
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
        //导航栏字体颜色
        brightness: Brightness.light,
        actions: <Widget>[
          //可交互的图标
          IconButton(icon: Icon(Icons.search), tooltip: "搜索", onPressed: () {}),
          IconButton(
            icon: Icon(Icons.add),
            tooltip: "添加",
            onPressed: () {
              //调用showMenu 方法来弹出菜单列表
              showMenu(
                  context: context,
                  color: Colors.lightBlue,
                  //代表动画区域距离容器上下左右的距离
                  position: RelativeRect.fromLTRB(500.0, 70.0, 0.0, 0.0),
                  //放单个值的弹出菜单项
                  items: <PopupMenuEntry>[
                    _popupMenuItem("发起群聊", icon: Icons.group),
                    _popupMenuItem("添加好友", icon: Icons.person_add),
                    _popupMenuItem("反馈和帮助", icon: Icons.email)
                  ]);
            },
          )
        ],
      ),
      //Drawer （抽屉组件）可以实现类似抽屉拉出推入效果
      drawer: Drawer(
        child: ListView(
          //修改drawer无法适应沉浸式状态栏问题
          padding: new EdgeInsets.all(0.0),
          children: <Widget>[
            //展示用户头像、用户名、 Email 等信息
            UserAccountsDrawerHeader(
              accountName: Text("DoctorWei"),
              accountEmail: Text("13482724747@qq.com"),
              //圆形头像
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/home.png"),
              ),
              onDetailsPressed: () {
                //跳转详情页
              },
              //用来设置当前用户的其他账号的头像(最多显示三个)
              otherAccountsPictures: <Widget>[
                Container(
                  child: Image.asset("assets/images/code.png"),
                )
              ],
            ),
            //条目组件通常用于在 Flutter 中填充 ListView
            ListTile(
              //左侧widget
              leading: CircleAvatar(
                child: Icon(Icons.color_lens),
              ),
              //标题
              title: Text("个性装扮"),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.photo),
              ),
              title: Text("我的相册"),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.wifi),
              ),
              title: Text("免流量特权"),
            )
          ],
        ),
      ),
      //BottomNavigationBar是底部导航条， 可以很容易地在tap之间切换和浏览顶级视图
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          //底部导航栏要显示的Item，有图标和标题组成
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text("信息"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text("通讯")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text("发现")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("我的")),
        ],
        //当前显示项的下表
        currentIndex: _selectIndex,
        //选中时BottomNavigationBarItem.icon和BottomNavigationBarItem.label的颜色
        selectedItemColor:Colors.yellow ,
        //未选中的BottomNavigationBarItem.icon和BottomNavigationBarItem.labels的颜色
        unselectedItemColor: Colors.grey,
        //点击导航栏子项的回调
        onTap: _onItemTapped,
      ),
      body: currentPage(),
      floatingActionButton: Builder(builder: (BuildContext context) {
        //FloatingActionButton （悬停按钮组件）
        return new FloatingActionButton(
          child: const Icon(Icons.add),
          tooltip: "提示信息",
          //前景色
          foregroundColor: Colors.white,
          //背景色
          backgroundColor: Colors.yellow,
          //未点击时阴影值，默认 6.0
          elevation: 7.0,
          //点击 阴影值
          highlightElevation: 14.0,
          //点击事件回调
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text("提示信息")));
          },
        );
      }),
    );
  }

  void _onItemTapped(int index) {
    //setState(){}的调用时吧视图重新绘制了一遍,调用了build方法，绘制只是绘制不一样的地方，
    setState(() {
      _selectIndex = index;
    });
  }

  currentPage() {
    switch (_selectIndex) {
      case 0:
        return HomePage();
      case 1:
        return FriendsPage();
      case 2:
        return FindPage();
      case 3:
        return MePage(context);
    }
  }
}
