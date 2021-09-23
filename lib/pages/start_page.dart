import 'package:dax_food/animations/FadeAnimation.dart';
import 'package:dax_food/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class StartPage extends StatefulWidget {
  const StartPage({ Key key }) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with TickerProviderStateMixin{

  AnimationController _animationcontroller;
  dynamic _animation;
  bool _textVisible = true;

  @override
  void initState() {
    _animationcontroller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500)
    );
    _animation = Tween(
      begin: 1.0,
      end: 25.0,
    ).animate(_animationcontroller);
    super.initState();
  }

  @override
  void dispose() {
    _animationcontroller.dispose();
    super.dispose();
  }

  void onTap(){
    setState(() {
      _textVisible = false;
    });
    _animationcontroller.forward().then(
      (f) => Navigator.push(context, 
      PageTransition(type: PageTransitionType.fade,child: HomePage()))
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/img3.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            colors: [
            Colors.black.withOpacity(.3),
            Colors.black.withOpacity(.2),
            Colors.black.withOpacity(.2)
          ])
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              FadeAnimation(4, Text('Taking Order For Faster Delivery', 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 50, 
                fontWeight: FontWeight.bold),
              )),

              SizedBox(height: 20,),

              FadeAnimation(4.0,Text('See resturants nearby \nadding location',
              style: TextStyle(
                fontSize: 18,height: 1.4,color: Colors.white
              ),)),

              SizedBox(height: 80,),

              FadeAnimation(4.2,
              ScaleTransition(
                scale: _animation,
                child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.yellow,
                    Colors.orange
                  ]),
                  borderRadius: BorderRadius.circular(30)
                ),
                
                child: AnimatedOpacity(
                  opacity: _textVisible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 50),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () => onTap(),
                    child: Text('Start',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
              ),
              )
              ),
              SizedBox(height: 30,),
              AnimatedOpacity(
                opacity: _textVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 50),
                child: Align(
                  child: Text("Now Deliver To Your Door 24/7",style: 
                  TextStyle(
                    color: Colors.white70,
                    fontSize: 16
                  ),),
                ),
              ),
              SizedBox(height: 10,)
            ],),
          ),
        ),
      ),
    );
  }
}