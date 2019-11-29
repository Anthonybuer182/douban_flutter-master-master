import 'dart:async';

import 'package:douban_flutter/constant/constant.dart';
import 'package:douban_flutter/util/screen_utils.dart';
import 'package:flutter/material.dart';

///登录页
class RegisterPage extends StatefulWidget {
  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<RegisterPage> {
  GlobalKey<FormState> loginKey=new GlobalKey();
String userName;
String passWord;
  void login(){
    var loginForm=loginKey.currentState;
    if(loginForm.validate()){
      loginForm.save();
      print("userName="+userName+"/n"+"passWord="+passWord);
    }
  }
  @override
  Widget build(BuildContext context) {
    print('build splash');
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: Form( key: loginKey,child: Column(
              children: <Widget>[
                TextFormField(decoration: InputDecoration(labelText: '用户名'),
                  onSaved: (value){
                    userName=value;
                  },),
                TextFormField(
                  decoration: InputDecoration(labelText: '密码'),
                  obscureText: true,
                  validator: (value){
                  return value.length<6?"密码长度不够":null;
                  },
                  onSaved: (value){
                    passWord=value;
                  },
                ),
              ],
            )),
          ),
          SizedBox(
            width: 340,
            height: 42,
            child: RaisedButton(onPressed: login,
            child: Text("注册",style: TextStyle(fontSize: 18),),),
          )
        ],
      ),
    );
  }
}
