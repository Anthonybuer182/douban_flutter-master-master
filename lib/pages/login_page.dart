import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///登录页
class LoginPage extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<LoginPage> {
  //需要设置一个全局类型的key，通过这个key的属性，来获取表单对象
  GlobalKey<FormState> loginKey = new GlobalKey();
  String userName;
  String passWord;

  void login() {
    //读取当前的Form状态
    var loginForm = loginKey.currentState;
    //验证Form表单
    if (loginForm.validate()) {
      Navigator.popAndPushNamed(context, "AppPage");
      //回调onSaved()方法
      loginForm.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    //脚手架组件 实现了基本的 Material Design布局只要是在 Material Design中定义过的单 个界面显示的布局组件元素，都可以使用 Scaffold 来绘制
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Material(
        child: Scaffold(
          backgroundColor: Colors.white,
          //垂直布局
          body: Column(
            children: <Widget>[
              //容器组 Container ）包含一个子 Widget ，自身具备如 alignment padding 等基础属性，方便布局过程中摆放 child
              Container(
                //外边距
                margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                //内边距
                padding: const EdgeInsets.all(16),
                //表单组件
                //Form 组件用来做整个表单提交使用的
                child: Form(
                    //组件在整个Widget树中的key值
                    key: loginKey,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          //图片组件
                          child: Image(
                            width: 140,
                            height: 140,
                            image: AssetImage("assets/images/logo.png"),
                          ),
                        ),
                        Container(
                          //TextFormField 组件用来做用户输入的
                          child: TextFormField(
                            decoration: InputDecoration(labelText: '请输入用户名'),
                            initialValue: "DoctorWei",
                            onSaved: (value) {
                              userName = value;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: TextFormField(
                            decoration: InputDecoration(labelText: '请输入密码'),
                            //是否隐藏输入
                            obscureText: true,
                            initialValue: "123456",
                            //自定义校验
                            validator: (value) {
                              return value.length < 6 ? "密码长度不够" : null;
                            },
                            //当Form表单调用保存方法save时回调
                            onSaved: (value) {
                              passWord = value;
                            },
                          ),
                        )
                      ],
                    )),
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                  //设置具体尺寸 用一个特定大小的盒子来限定 child的宽度和高度
                  child: SizedBox(
                    width: 340,
                    height: 42,
                    //凸起按钮组件（ RaisedButton ）
                    child: RaisedButton(
                      //当按下调用login方法
                      onPressed: login,
                      //文本组件
                      child: Text(
                        "登录",
                        //文本样式 可定义文本大小，颜色，粗细
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),

                      color: Colors.lightBlue,
                    ),
                  )),
              //Expanded组件可以使Row、Column、Flex等子组件在其主轴方向上展开并填充可用空间
              Expanded(
                //Align 组件即对齐组件，能将子组件按指定方式对齐，并根据子组件的大小调整自己的大小
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Image(
                    image: AssetImage("assets/images/login_back.png"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
