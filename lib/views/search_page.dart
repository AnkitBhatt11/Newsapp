import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_api/helper/data.dart';
import 'package:news_app_api/helper/news.dart';
import 'package:news_app_api/helper/widgets.dart';
import 'package:news_app_api/models/categorie_model.dart';
import 'package:news_app_api/views/homepage.dart';
import 'package:news_app_api/widget/colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool _loading;
  var newslist;

  List<CategorieModel> categories = List<CategorieModel>();

   getNews(c) async {
    Newss news = Newss();
    await news.getNews(c);
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }
 var c = 'en';
  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();
   
    categories = getCategories();
    getNews(c);
  }
 TextEditingController cont = TextEditingController();
   @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    cont.dispose();
    super.dispose();
  }
 void _onRefresh() async {
    print("vjbdvjhdbvjif");
    // page = 1;
    getNews(c);
    await Future.delayed(Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }
var ch;
  void _onLoading(context) async {
    print("loadedede");
   getNews(c);
  }
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      // backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      //    backgroundColor: Colors.grey.withOpacity(0.5),
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: Icon(
      //       Icons.arrow_back_ios_new_rounded,
      //       color: Colors.black,
      //     ),
      //   ),
      //   title: Text(
      //     "Search",
      //     style: GoogleFonts.poppins(
      //       fontSize: 24,
      //       fontWeight: FontWeight.w500,
      //       color: Colors.black,
      //     ),
      //   ),
      // ),
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
                      SizedBox(
                        height: 5,
                      ),
                      //  SearchBar(),

                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: TextFormField(
                          controller: cont,
                          // on
                          onFieldSubmitted: (val) {
                            
                            // val=ch;
                            getNews(val);
                          },
                          autofocus: true,
                          style: TextStyle(fontSize: 15.0, color: Colors.black),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Search',
                            hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(fontSize: 14),
                            ),
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: text8),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: text8),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 70,
                        child: FutureBuilder(
                          future: getNews(cont.text),
                          builder: (context,snapshot) {
                            return   SmartRefresher(
                                  controller: refreshController,
                                  enablePullUp: true,
                                  enablePullDown: false,
                                  onRefresh: _onRefresh,
                                  onLoading: () => _onLoading(context),
                                  child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categories.length,
                                  itemBuilder: (context, index) {
                                    return CategoryCard(
                                      imageAssetUrl: categories[index].imageAssetUrl,
                                      categoryName: categories[index].categorieName,
                                    );
                                  }),
                            );
                          }
                        ),
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
