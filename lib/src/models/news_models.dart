// To parse this JSON data, do
//
//     final newsResponse = newsResponseFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

NewsResponse newsResponseFromJson(String str) =>
    NewsResponse.fromJson(json.decode(str));

String newsResponseToJson(NewsResponse data) => json.encode(data.toJson());

class NewsResponse {
  NewsResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    required this.source,
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  Source source;
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  DateTime publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        // ignore: prefer_if_null_operators
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        // ignore: prefer_if_null_operators
        description: json["description"] == null ? null : json["description"],
        url: json["url"],
        // ignore: prefer_if_null_operators
        urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        // ignore: prefer_if_null_operators
        content: json["content"] == null ? null : json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        // ignore: prefer_if_null_operators
        "author": author == null ? null : author,
        "title": title,
        // ignore: prefer_if_null_operators
        "description": description == null ? null : description,
        "url": url,
        // ignore: prefer_if_null_operators
        "urlToImage": urlToImage == null ? null : urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content == null ? null : content,
      };
}

class Source {
  Source({
    this.id,
    required this.name,
  });

  String? id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
      };
}
