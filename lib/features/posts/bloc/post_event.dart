part of 'post_bloc.dart';

abstract class PostEvent {}

class PostsInitialFetchEvent extends PostEvent {}

class PostAddEvent extends PostEvent {}
