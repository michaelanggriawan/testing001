import 'dart:convert';
import 'package:coronaartikel/service/webservice.dart';
import 'package:coronaartikel/utils/constant.dart';

class VirusArticle {
  final String title;
  final String author;
  final String content;
  final String picture;
  final String date;

  VirusArticle({this.title, this.author, this.content, this.picture, this.date});

  factory VirusArticle.fromJson(Map<String, dynamic> json) {
    return VirusArticle(
      title: json['title'],
      author: json['author'],
      content: json['content'],
      picture: json['picture'],
      date: json['date']
    );
  }

  static Resource<List<VirusArticle>> get all {

    return Resource(
      url: Constants.api,
      parse: (response) {
        final result = json.decode(response.body);
        Iterable list = result;
        return list.map((model) => VirusArticle.fromJson(model)).toList();
      }
    );
  }
}