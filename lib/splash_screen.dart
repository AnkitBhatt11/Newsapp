import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app_api/signup/login_with_google.dart';
import 'package:news_app_api/views/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      body: Container(
        
        color: Colors.lightBlueAccent,
        child: 
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.network("https://cdn.dribbble.com/users/2404/screenshots/15065505/media/c3d68d663aedcc0479328838167e0333.png?compress=1&resize=400x300",
              width:_widthScale* 160,
              height:_heightScale* 160,
              fit: BoxFit.contain,
              ),
              SizedBox(height:_heightScale* 10,),
              Text(
                "Flutter News App",
                style:
                TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.w600),
              ),
              SizedBox(height:_heightScale* 300,),
              Text("Explore Fast Trending News.....",style:TextStyle(color: Colors.white,fontSize: 25, fontWeight: FontWeight.w600),
              ),
             
               SizedBox(height:_heightScale* 50,),
            ],
          ),
        ),
   
      ),
    );
  }
}