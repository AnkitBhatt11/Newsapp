// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:news_app_api/helper/data.dart';
// import 'package:news_app_api/helper/news.dart';
// import 'package:news_app_api/main.dart';
// import 'package:news_app_api/models/categorie_model.dart';
// import 'package:news_app_api/sharedpref/token.dart';
// import 'package:news_app_api/sharedpref/token_profile.dart';
// import 'package:news_app_api/views/article_view.dart';
// import 'package:news_app_api/views/homepage.dart';

// class BookMark extends StatefulWidget {
//   const BookMark({Key key}) : super(key: key);

//   @override
//   State<BookMark> createState() => _BookMarkState();
// }

// class _BookMarkState extends State<BookMark> {
//     bool _loading;
//   var newslist;

//   List<CategorieModel> categories = List<CategorieModel>();

//   void getNews() async {
//     News news = News();
//     await news.getNews();
//     newslist = news.news;
//     setState(() {
//       _loading = false;
//     });
//   }

//   @override
//   void initState() {
//     _loading = true;
//     // TODO: implement initState
//     super.initState();
//     // bookmark();
//     // tokenPreference=TokenPreference();
//     categories = getCategories();
//     getNews();
//   }

//   // Future bookmark()async{
//   //   tokenProfile=TokenProfile.fromJson(await tokenPreference.getTokenPreferenceData());
//   //   var vall = await tokenPreference.getTokenPreferenceData();
    
//   //   print("jhj+$vall");
    
//   // }
//   @override
//   Widget build(BuildContext context) {
//     const double kDesignWidth = 375;
//     const double kDesignHeight = 812;
//     double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
//     double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
//     return Scaffold(
//       body: 
//       // FutureBuilder(
//       //   future: bookmark(),
//       //   builder: (context,snapshot) {
//            Container(),
//         // }
//       // ),
//     );
//   }
// }
// class NewsTile extends StatelessWidget {
//   final String imgUrl, title, desc, content, posturl;
//   var keyy,value;

//   NewsTile({this.imgUrl, this.desc, this.title, this.content, @required this.posturl,this.keyy,this.value});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: (){
//         Navigator.push(context, MaterialPageRoute(
//             builder: (context) => ArticleView(
//               postUrl: posturl,
//             )
//         ));
//       },
//       child: Container(
//           margin: EdgeInsets.only(bottom: 24),
//           width: MediaQuery.of(context).size.width,
//           child: Container(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               alignment: Alignment.bottomCenter,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   ClipRRect(
//                       borderRadius: BorderRadius.circular(6),
//                       child: Image.network(
//                         imgUrl,
//                         height: 200,
//                         width: MediaQuery.of(context).size.width,
//                         fit: BoxFit.cover,
//                       )),
//                   SizedBox(height: 12,),
//                   Text(
//                     title,
//                     maxLines: 2,
//                     style: TextStyle(
//                         color: Colors.black87,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500),
//                   ),
//                   SizedBox(
//                     height: 4,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Text(
//                           desc,
//                           maxLines: 2,
//                           style: TextStyle(color: Colors.black54, fontSize: 14),
//                         ),
//                       ),
//                       IconButton(icon:Icon(Icons.favorite_border),onPressed: (){
//                     Hive.box(FAVORITES_BOX).put(keyy, value);
//                   },),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           )),
//     );
//   }
// }