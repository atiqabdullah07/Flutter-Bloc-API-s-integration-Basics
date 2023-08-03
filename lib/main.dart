import 'package:blocpractice/features/posts/UI/posts_pages.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MaterialApp(
    title: "Bloc APIs",
    home: PostsPage(),
    debugShowCheckedModeBanner: false,
  ));
}
