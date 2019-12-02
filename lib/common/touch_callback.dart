import 'package:flutter/material.dart';

//触摸回调组件
class TouchCallBack extends StatefulWidget{
  //子组件
  final Widget child;
  //回调函数
  final VoidCallback onPressed;
  //是否添加背景色
  final bool isfeed;
  //背景色
  final Color background;
  //构造方法 传入参数列表
  TouchCallBack({Key key,
    //使用@required说明它是一个必传的参数
    @required this.child,
    @required this.onPressed,
    this.isfeed:true,
    this.background:const Color(0xffd8d8d8),
    //调用父类的方法
  }):super(key:key);
  @override
  TouchState createState() => TouchState();
}

class TouchState extends State<TouchCallBack>{
  Color color =  Colors.transparent;
  @override
  Widget build(BuildContext context) {
    //返回手势检测 GestureDetector对象
    return GestureDetector(
      //使用Container容器包裹
      child: Container(
        color: color,
        child: widget.child,
      ),
      //点击屏幕
      onTap: widget.onPressed,
      //指针已接触屏幕并可能开始移动;按下去要设置颜色
      onPanDown: (d){
        //判断是否添加点击背景
        if(widget.isfeed == false) return;
        setState(() {
          color = widget.background;
        });
      },
      //先前触发 onPanDown 的指针未完成;抬手后要设置颜色
      onPanCancel: (){
        setState(() {
          color = Colors.transparent;
        });
      },
    );
  }

}