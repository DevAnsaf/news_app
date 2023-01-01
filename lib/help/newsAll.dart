import 'dart:convert';

import 'package:news_app_final/model/model_article.dart';
import 'package:http/http.dart' as http;

class AllNews {
  List<ArticleModel> news = [];
  Future<void> getAllNews() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=ca&apiKey=c3632436a59f45f28cc7e16de7bbbcaa";

    var response = await http.get(Uri.parse(url));
    var jData = jsonDecode(response.body);

    if (jData['status'] == "ok") {
      jData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            url: element["url"],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}

class NewsCategory {
  List<ArticleModel> news = [];
  Future<void> getAllNews(String category) async {
    String url =
        "https://newsapi.org/v2/top-headlines?category=$category&country=ca&apiKey=c3632436a59f45f28cc7e16de7bbbcaa";

    var response = await http.get(Uri.parse(url));
    var jData = jsonDecode(response.body);

    if (jData['status'] == "ok") {
      jData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            url: element["url"],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
          );
          news.add(articleModel);
        }
      });
    }
  }
}
