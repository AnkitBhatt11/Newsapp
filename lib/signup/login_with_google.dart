import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app_api/provider/google_login.dart';
import 'package:news_app_api/views/check.dart';
import 'package:news_app_api/views/homepage.dart';
import 'package:news_app_api/widget/bottom_bar.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("hasdatanot");
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            print("hasdata");
            // return HomePage();
            return MyNavigationBar();
          } else if (snapshot.hasError) {
            print("hasdata1");
            return Center(
              child: Text("Something Went Wrong!!!"),
            );
          } else {
            print("hasdata2");
            return Container(
              // color: Colors.lightBlueAccent.withOpacity(0.2),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //We take the image from the assets
                SizedBox(height: _heightScale*140,),
                Image.network(
                      "https://cdn.dribbble.com/users/2404/screenshots/15065505/media/c3d68d663aedcc0479328838167e0333.png?compress=1&resize=400x300",
                      width: _widthScale * 180,
                      height: _heightScale * 180,
                      fit: BoxFit.contain,
                    ),
                SizedBox(
                  height:_heightScale* 50,
                ),
                //Texts and Styling of them
                Text(
                  'Welcome to Flutter News App',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 28,fontWeight: FontWeight.bold),
                ),
                SizedBox(height:_heightScale* 15),
                Padding(
                  padding: const EdgeInsets.only(left:30.0,right: 30),
                  child: Text(
                    'A one-stop portal for you to learn the latest news fast and explore',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontWeight:FontWeight.w500 ,fontSize: 16),
                  ),
                ),
                SizedBox(
                  height:_heightScale*50,
                ),
                //Our MaterialButton which when pressed will take us to a new screen named as 
                //LoginScreen
               Padding(
                 padding: const EdgeInsets.only(left:30.0,right: 30),
                 child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue.withOpacity(0.4),
                                foregroundColor: Colors.black,
                                minimumSize: Size(double.infinity, 50),
                              ),
                              icon: FaIcon(FontAwesomeIcons.google,color: Colors.white),
                              label: const Text('  Continue with Login',
                              style: TextStyle(color: Colors.white, fontWeight:FontWeight.w500),
                              ),
                              onPressed: () async {
                                final provider =
                                    Provider.of<GoogleSignInProvider>(context,
                                        listen: false);
                                await provider.googleLogin();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Check()));
                              }),
               ),
              ],
            ),
              
             

            );
          }
        },
      ),
    );
  }
}


