part of 'post_bloc.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostActionState extends PostState {}

class PostFetchingSuccessfull extends PostState {
  final List<PostDataModel> posts;

  PostFetchingSuccessfull({required this.posts});
}

class LoadingState extends PostState {}

class LoadingErrorState extends PostState {}

class PostsActionSuccessState extends PostActionState {}
