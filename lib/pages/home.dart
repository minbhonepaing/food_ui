import 'package:dax_food/animations/FadeAnimation.dart';
import 'package:dax_food/pages/darkHome.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: Icon(null),
        brightness: Brightness.light,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.grey[800],
              size: 28,
            )
          ),
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DarkHomePage()));
            }, 
            icon: Icon(
              Icons.dark_mode_rounded,
              color: Colors.grey[800],
              size: 28,
            )
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(children: [
                FadeAnimation(1, Text('Dax Shop',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.grey[80]),)
              ),
              SizedBox(width: 10,),
              FadeAnimation(1, Icon(Icons.shopping_cart,color: Colors.yellow[800],size: 29,)),
              ],),
              SizedBox(height: 30,),
              
              Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    FadeAnimation(1.2, makeCategory(isActive: true , title: 'Burger')),
                    FadeAnimation(1.4, makeCategory(isActive: false , title: 'Pizza')),
                    FadeAnimation(1.5, makeCategory(isActive: false , title: 'Desert')),
                    FadeAnimation(1.6, makeCategory(isActive: false , title: 'Salad')),
                    FadeAnimation(1.7, makeCategory(isActive: false , title: 'Juice')),
                  ],
                )
              ),
              SizedBox(height: 40,),

              FadeAnimation(1, Text('Free Delivery',style: TextStyle(
                color: Colors.grey[700],
                fontSize: 23,
                fontWeight: FontWeight.bold
              ),)),
            ],),
          ),
          SizedBox(height: 10,),
          Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      FadeAnimation(1.4, makeItem(image: 'assets/images/img4.png',price: '7',name: 'Burger')),
                      FadeAnimation(1.5, makeItem(image: 'assets/images/one.jpg',price: '10',name: 'Vegetarian Pizza')),
                      FadeAnimation(1.6, makeItem(image: 'assets/images/Desert.png',price: '12',name: 'Macaroon')),
                      FadeAnimation(1.7, makeItem(image: 'assets/images/salad.jpg',price: '5',name: 'Salad')),
                      FadeAnimation(1.8, makeItem(image: 'assets/images/juice.png',price: '3',name: 'Juice')),
                    ],
                  ),
                )
              ),
              SizedBox(height: 50,),
        ],),
      )
    );
  }
  Widget makeCategory({isActive , title}){
    return AspectRatio(
      aspectRatio: isActive ? 3 : 2.5,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? Colors.yellow[800] : Colors.white,
          borderRadius: BorderRadius.circular(50)
        ),
        margin: EdgeInsets.only(right: 10),
        child: Align(child: Text(
         title , style: TextStyle(
           color: isActive ? Colors.white : Colors.grey[800],
           fontSize: 18,
           fontWeight: isActive ? FontWeight.bold : FontWeight.w100
         ),
        ),),
      ),
    );
  }
  Widget makeItem({image,String price,String name}){
    return AspectRatio(
      aspectRatio: 1/1.3,
      child: GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              // gradient: LinearGradient(
              //   begin: Alignment.bottomCenter,
              //   stops: [.2 , .6],
              //   colors: [
              //     Colors.black.withOpacity(.2),
              //     Colors.black.withOpacity(.1)
              //   ]
              // )
            ),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.favorite_sharp,color: Colors.pink,)
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text("\$$price",
                        style: TextStyle(fontSize: 38,color: Colors.white,fontWeight: FontWeight.bold)
                      ),
                      Text(name,
                        style: TextStyle(fontSize: 28,color: Colors.white)
                      ),
                    ],)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}