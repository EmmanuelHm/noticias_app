import 'package:flutter/material.dart';
import 'package:noticias_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _APIKEY = 'a3e31fb6ae284c7c96fd540d83ef9701';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final url =
        Uri.parse('$_URL_NEWS/top-headlines?apiKey=$_APIKEY&country=mx');
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
