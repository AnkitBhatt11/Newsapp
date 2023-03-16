import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app_api/signup/login_with_google.dart';
import 'package:news_app_api/views/homepage.dart';
import 'package:news_app_api/widget/bottom_bar.dart';



class Check extends StatelessWidget {
  const Check({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context)=> Scaffold(
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
            return MyNavigationBar();
            // return HomePage();
          } else if (snapshot.hasError) {print("hasdata1");
            return Center(
              child: Text("Something Went Wrong!!!"),
            );
          } else {
            print("hasdata2");
            return LoginScreen();
          }
        },
      ),
    );
  
}
// class Check extends StatefulWidget {
//   const Check({Key key}) : super(key: key);

//   @override
//   State<Check> createState() => _CheckState();
// }

// class _CheckState extends State<Check> {
//   @override
//   Widget build(BuildContext context) {
//     print("hasdatajjjjj");
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           print("hasdatanot");
//           return Center(            
//             child: CircularProgressIndicator(),
//           );
//         } else if (snapshot.hasData) {
//           print("hasdata");
//           return HomePage();
//         } else if (snapshot.hasError) {print("hasdata1");
//           return Center(
//             child: Text("Something Went Wrong!!!"),
//           );
//         } else {
//           print("hasdata2");
//           return LoginScreen();
//         }
//       },
//     );
//   }
// }
