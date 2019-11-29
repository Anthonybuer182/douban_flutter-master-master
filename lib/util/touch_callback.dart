import 'package:flutter/material.dart';

class TouchCallBack extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool isFeed;
  final Color backgound;

  TouchCallBack(
      {Key key,
      @required this.child,
      @required this.onPressed,
      this.isFeed: true,
      this.backgound: const Color(0xffd8d8d8),})
      : super(key: key);

  @override
  TouchState createState() => TouchState();
}

class TouchState extends State<TouchCallBack> {
  Color color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        color: color,
        child: widget.child,
      ),
      onTap: widget.onPressed,
      onPanDown: (d) {
        if (widget.isFeed == false) return;
        setState(() {
          color = widget.backgound;
        });
      },
      onPanCancel: () {
        setState(() {
          color = Colors.transparent;
        });
      },
    );
  }
}
