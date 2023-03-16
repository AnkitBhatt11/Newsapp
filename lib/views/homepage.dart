import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app_api/helper/data.dart';
import 'package:news_app_api/helper/widgets.dart';
import 'package:news_app_api/main.dart';
import 'package:news_app_api/models/categorie_model.dart';
import 'package:news_app_api/sharedpref/token.dart';
import 'package:news_app_api/views/article_view.dart';
import 'package:news_app_api/views/categorie_news.dart';
import 'package:news_app_api/views/search_page.dart';
import 'package:news_app_api/widget/app_drawer.dart';
import 'package:news_app_api/widget/colors.dart';
import '../helper/news.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _loading;
  var newslist;

  List<CategorieModel> categories = List<CategorieModel>();

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();

    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    const double kDesignWidth = 375;
    const double kDesignHeight = 812;
    double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    double _heightScale = MediaQuery.of(context).size.height / kDesignHeight;
    TextEditingController cont=TextEditingController();
    return Scaffold(
      drawer: AppDrawer(),
      appBar: MyAppBar(),
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      /// Categories
                       SizedBox(height: 5,),
                      //  SearchBar(),

                        GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
                child: Container(
                  height: _heightScale * 50,
                  width: double.infinity,
                  color: Colors.white.withOpacity(0.4),
                  child: Column(
                    children: [
                      SizedBox(
                        height: _heightScale * 8,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: _widthScale * 15,
                          ),
                          Icon(Icons.search),
                          SizedBox(
                            width: _widthScale * 15,
                          ),
                          Text(
                            "Search",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  fontSize: _widthScale * 15,
                                  color: text12.withOpacity(0.8)),
                            ),
                          ),
                          SizedBox(
                            width: _widthScale * 60,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _heightScale * 4,
                      ),
                    ],
                  ),
                ),
              ),

                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 70,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return CategoryCard(
                                imageAssetUrl: categories[index].imageAssetUrl,
                                categoryName: categories[index].categorieName,
                              );
                            }),
                      ),

                      /// News Article
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            itemCount: newslist.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NewsTile(
                                imgUrl: newslist[index].urlToImage ?? "",
                                title: newslist[index].title ?? "",
                                desc: newslist[index].description ?? "",
                                content: newslist[index].content ?? "",
                                posturl: newslist[index].articleUrl ?? "",
                                                                value: newslist[index].articleUrl??"",
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;
  var value;

  NewsTile({this.imgUrl, this.desc, this.title, this.content, @required this.posturl,this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              postUrl: posturl,
            )
        ));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 12,),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          desc,
                          maxLines: 2,
                          style: TextStyle(color: Colors.black54, fontSize: 14),
                        ),
                      ),
                      IconButton(icon:Icon(Icons.favorite_border),onPressed: ()async{
                    // Hive.box(FAVORITES_BOX).put(keyy, value);
                    // print("val+$value");
                    // await tokenPreference.setTokenPreferenceData(value);
                  },),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}


class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;

  CategoryCard({this.imageAssetUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => CategoryNews(
            newsCategory: categoryName.toLowerCase(),
          )
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: CachedNetworkImage(
                imageUrl: imageAssetUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                color: Colors.black26
              ),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
