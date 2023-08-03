import 'dart:convert';
import 'dart:developer';

import 'package:blocpractice/features/posts/Models/post_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo {
  static Future<List<PostDataModel>> fetchPost() async {
    var client = http.Client();
    List<PostDataModel> posts = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List result = jsonDecode(response.body);

      for (var i = 0; i < result.length; i++) {
        PostDataModel post =
            PostDataModel.fromJson(result[i] as Map<String, dynamic>);
        posts.add(post);
      }

      return posts;
    } catch (e) {
      log("Repo Error $e");
      return [];
    }
  }

  static Future<bool> addPost() async {
    var client = http.Client();
    List<PostDataModel> posts = [];
    try {
      var response = await client
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
        "title": "Hello World",
        "body": "Learning Bloc form a very Long time",
        "userId": "34"
      });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log("Repo Error $e");
      return false;
    }
  }
}
