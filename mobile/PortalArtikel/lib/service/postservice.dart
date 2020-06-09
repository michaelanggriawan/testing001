
import 'dart:async';
import 'dart:convert';import 'package:http/http.dart' as http;

class Resource<T> {
  final String url;
  final String title;
  final String author;
  final String content;
  final String picture;

  T Function(http.Response response) parse;

  Resource(this.url, this.title, this.author, this.content, this.picture);
}

class PostService {
  Future<T> postData<T>(Resource<T> resource) async {
    final response = await http.post(resource.url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String> {
          'title': resource.title,
          'author': resource.author,
          'content': resource.content,
          'picture': resource.picture
        })
    );

    if (response.statusCode == 201) {
      return resource.parse(response);
    } else {
      throw Exception('Failed to post data');
    }
  }
}