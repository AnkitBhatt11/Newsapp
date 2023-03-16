import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app_api/views/check.dart';



class GoogleSignInProvider extends ChangeNotifier{
final googleSignIn=GoogleSignIn();
GoogleSignInAccount _user;
GoogleSignInAccount get user =>_user;
Future googleLogin()async{
  try{
    print("hasdata67");
  final googleUser=await googleSignIn.signIn();
  if(googleUser==null) return;
  _user=googleUser;

  final googleAuth=await googleUser.authentication;

  final credential=GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,

  );
  // Navigator.push(context,MaterialPageRoute(builder: (context)=>Check()));
print("hasdatttt");
  await FirebaseAuth.instance.signInWithCredential(credential);
  }catch(e){
    print("hasdata09");
    print(e.toString());
  }
  notifyListeners();
}

Future logout()async{
  await googleSignIn.disconnect();
  FirebaseAuth.instance.signOut();
}
}