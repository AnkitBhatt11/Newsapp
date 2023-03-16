// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// TokenPreference tokenPreference = TokenPreference();

// class TokenPreference {
//   static const _USER_DATA = 'USERDATA';

//   setTokenPreferenceData(String data) async {
//     SharedPreferences.setMockInitialValues({});
//     print("ho jayegjjjj+$data");
//     SharedPreferences prefs = await SharedPreferences.getInstance();
// print("ho jayegii");
//     prefs.setString(_USER_DATA, data);
//     print("ho jayeg");
//   }

//   getTokenPreferenceData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String data;
//     try {
//       data = prefs.get(_USER_DATA);
//       data = json.decode(data);
//       print("lll$data");
//     } catch (e) {
//       print("lllll$e");
//       data = null;
//     }

//     return data;
//   }

//   cleartTokenPreferenceData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     try {
//         prefs.remove(_USER_DATA);
//     //  return tokenProfile?.token = null;
      
//     } catch (e) {
//       print('inside userPref clear error: $e');
// }
// }
// }