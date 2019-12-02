import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouseSliderDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    //[1,2,3,4,5].map(f).toList()
    return CarouseSliderDemoState();
  }

}

class CarouseSliderDemoState extends State<CarouseSliderDemo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CarouselSlider(items:[1,2,3,4,5].map((i){
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all( Radius.circular(20)),
          image:DecorationImage(image: AssetImage("assets/images/home.png")),

        ),
      );
    }).toList());
  }

}