import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app_api/provider/google_login.dart';
import 'package:news_app_api/sharedpref/token.dart';
import 'package:news_app_api/splash_screen.dart';
import 'package:news_app_api/views/homepage.dart';
import 'package:provider/provider.dart';


// void main() => runApp(MyApp());
// const String SETTINGS_BOX="settings";
// const String API_BOX="api_data";
// const String FAVORITES_BOX="favorites_box";
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

   @override
  Widget build(BuildContext context) =>ChangeNotifierProvider(create: (context)=> GoogleSignInProvider(),
  child:  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: SplashScreen(),
    ));
  
}