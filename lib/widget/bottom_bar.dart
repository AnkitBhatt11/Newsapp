
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app_api/provider/google_login.dart';
import 'package:news_app_api/views/bookmark.dart';
import 'package:news_app_api/views/homepage.dart';
import 'package:provider/provider.dart';

class MyNavigationBar extends StatefulWidget {  
  MyNavigationBar ({Key key}) : super(key: key);  
  
  @override  
  _MyNavigationBarState createState() => _MyNavigationBarState();  
}  
  
class _MyNavigationBarState extends State<MyNavigationBar > {  
  int _selectedIndex = 0;  
   List<Widget> _widgetOptions = <Widget>[  
    // Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
    HomePage(),
    // BookMark(),
    Text('Tried its code written but getting error', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
     
  ];  
  
  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      // appBar: AppBar(  
      //   title: const Text('Flutter BottomNavigationBar Example'),  
      //     backgroundColor: Colors.green  
      // ),  
      body: Center(  
        child: _widgetOptions.elementAt(_selectedIndex),  
      ),  
      bottomNavigationBar: BottomNavigationBar(  
        items:  <BottomNavigationBarItem>[  
          BottomNavigationBarItem(  
            icon: Icon(Icons.home),  
            label: 'Home', 
             
            // backgroundColor: Colors.green  
            backgroundColor: Colors.grey.withOpacity(0.5),
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.bookmark),  
            // title: Text('Search'),  
            label: 'BookMark', 
            // backgroundColor: Colors.yellow 
            backgroundColor: Colors.grey.withOpacity(0.5), 
          ),  
          
        ],  
        type: BottomNavigationBarType.shifting,  
        currentIndex: _selectedIndex,  
        selectedItemColor: Colors.black,  
        iconSize: 30,  
        onTap: _onItemTapped,  
        elevation: 5  
      ),  
    );  
  }  
} 