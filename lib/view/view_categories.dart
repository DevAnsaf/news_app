import 'package:flutter/material.dart';
import 'package:news_app_final/help/newsAll.dart';
import 'package:news_app_final/model/model_article.dart';
import 'package:news_app_final/view/view_articles.dart';
import 'package:news_app_final/help/datas.dart';

class ViewCategories extends StatefulWidget {
  // const ViewCategories({Key? key}) : super(key: klate ey);
  final String newrcategory;
  ViewCategories({required this.newrcategory});
  @override
  State<ViewCategories> createState() => _ViewCategoriesState();
}

class _ViewCategoriesState extends State<ViewCategories> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _load = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNewsCategory();
  }

  getNewsCategory() async {
    NewsCategory newsCls = NewsCategory();
    await newsCls.getAllNews(widget.newrcategory);
    articles = newsCls.news;
    setState(() {
      _load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "~ Global News ~",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Icon(Icons.add)),
          )
        ],
        elevation: 0.0,
      ),
      body: _load
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                child: Column(
                  children: <Widget>[
                    /// Articles
                    Container(
                      child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,

                          ///to Scroll articles
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Newstile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              describ: articles[index].description,
                              url: articles[index].url,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

///remove check
class Newstile extends StatelessWidget {
  final String imageUrl, title, describ, url;

  Newstile({
    required this.imageUrl,
    required this.title,
    required this.describ,
    required this.url,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ViewArticle(newsUrl: url)));
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ////////////////////////////////////////////////
            // Text(categoriesName),
            SizedBox(height: 10),
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(imageUrl)),
            SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            Text(
              describ,
              style: TextStyle(fontSize: 14, color: Colors.brown),
            ),

            Divider(
              color: Colors.blue,
              thickness: 2,
              indent: 100,
              endIndent: 100,
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
