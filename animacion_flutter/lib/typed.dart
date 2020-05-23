import 'package:flutter/material.dart';
import 'dart:async';
class Typed extends StatefulWidget {
  @override
  _TypedState createState() => _TypedState();
}

class _TypedState extends State<Typed> with TickerProviderStateMixin{
  AnimationController animationController1,animationController2;
  Animation<double> animation,animation2;

  void initState(){
    animationController1 = AnimationController(
      duration: (Duration(milliseconds: 600)),
      vsync: this,
    );
    animationController2 = AnimationController(
      duration: (Duration(milliseconds: 600)),
      vsync: this,
    );

    animation = Tween(
      begin: 4.0,
      end: 0.0,
    ).animate(animationController1)..addListener((){
      setState(() {
      });
    });
    animation2 = Tween(
      begin: 0.0,
      end: 4.0,
    ).animate(animationController2)..addListener((){
      setState(() {
      });
    });
    animationController1.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController1.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController1.forward();
      }
    });
    animationController2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController2.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animationController2.forward();
      }
    });
    Future.delayed(Duration(milliseconds: 300),
            () => animationController1.forward());
    Future.delayed(Duration(milliseconds: 300),
            () => animationController2.forward());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 400,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 220),
            child: Text("IMB Watson",
              style: TextStyle(
                  color: Colors.black,fontSize: 15,fontWeight: FontWeight.w800
              ),),
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    transform: Matrix4.translationValues(0.0, animation2.value*5, 0.0),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(49,81,183,1),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, 10, 0.0),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(49,81,183,1),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    transform: Matrix4.translationValues(0.0, animation.value*5, 0.0),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(49,81,183,1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20),
              Padding(
                padding: EdgeInsets.only(top:12),
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(244,244,244,1),
                    borderRadius: BorderRadius.only(
                        topLeft:  Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                        bottomLeft:  Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0)
                    ),
                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text("Watson is responding...",
                          style: TextStyle(color: Color.fromRGBO(118, 118, 118,1),fontSize: 16)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
