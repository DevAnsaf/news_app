import 'dart:core';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app_final/help/datas.dart';
import 'package:news_app_final/help/newsAll.dart';
import 'package:news_app_final/model/model_article.dart';
import 'package:news_app_final/model/model_category.dart';
import 'package:flutter/material.dart';
import 'package:news_app_final/view/view_articles.dart';
import 'package:news_app_final/view/view_categories.dart';
// import 'package:news_app_final/view/home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];

  bool _load = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();

    getAllNews();
  }

  getAllNews() async {
    AllNews newsCls = AllNews();
    await newsCls.getAllNews();
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
              "~ News App ~",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: _load
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: <Widget>[
                    /// List of Categories
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      height: 90,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,

                          ///to scroll categories
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryList(
                              imageUrl: categories[index].imageUrl,
                              categoriesName: categories[index].categoriesName,
                            );
                          }),
                    ),

                    Divider(
                      color: Colors.blue,
                      thickness: 2,
                      indent: 10,
                      endIndent: 10,
                    ),
                    SizedBox(height: 10),

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

class CustomSearchDelegate extends SearchDelegate {
  String searchTerms = [' '] as String;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }

  // @override
  // Widget buildResults(BuildContext context) {
  //   //TODO: implement buildResults
  //   throw UnimplementedError();
  // }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // TODO: implement buildSuggestions
  //   throw UnimplementedError();
  // }
}

@override
Widget buildResults(BuildContext context) {
  List<String> matchQuery = [];
  var searchTerms;
  for (var fruit in searchTerms) {
    var query;
    if (fruit.toLowerCase().contains(query.toLowerCase())) {
      matchQuery.add(fruit);
    }
  }
  return ListView.builder(
    itemCount: matchQuery.length,
    itemBuilder: (context, index) {
      var result = matchQuery[index];
      return ListTile(title: Text(result));
    },
  );
}

@override
Widget buildSuggestions(BuildContext context) {
  List<String> matchQuery = [];
  var searchTerms;
  for (var fruit in searchTerms) {
    var query;
    if (fruit.toLowerCase().contains(query.toLowerCase())) {
      matchQuery.add(fruit);
    }
  }
  return ListView.builder(
    itemCount: matchQuery.length,
    itemBuilder: (context, index) {
      var result = matchQuery[index];
      return ListTile(
        title: Text(result),
      );
    },
  );
}

class CategoryList extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String imageUrl, categoriesName;

  CategoryList({
    required this.imageUrl,
    required this.categoriesName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => NewsCategory(
        //             category: categoriesName.toString().toLowerCase())));
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewCategories(
                      newrcategory: categoriesName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 5),
        child: Stack(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 119,
                  height: 65,
                  fit: BoxFit.cover,
                )),
            Container(
              alignment: Alignment.center,
              width: 119,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white12,
              ),
              child: Text(
                categoriesName,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
