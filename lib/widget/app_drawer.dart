import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app_api/provider/google_login.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    final user = FirebaseAuth.instance.currentUser;
    return Container(
      width: 350,
      child: Drawer(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height:_heightScale* 100,
            ),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL),
            ),
            SizedBox(
              height:_heightScale* 15,
            ),
            Text(
              'Name: ' + user.displayName,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height:_heightScale* 10,
            ),
            Text(
              'Email: ' + user.email,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height:_heightScale* 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  icon: Icon(Icons.logout),
                  label: const Text('LogOut'),
                  onPressed: () async {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    await provider.logout();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
