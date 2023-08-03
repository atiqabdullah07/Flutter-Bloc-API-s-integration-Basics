import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blocpractice/features/posts/Models/post_model.dart';
import 'package:blocpractice/features/posts/repos/posts_repo.dart';

part 'post_event.dart';
part 'post_state.dart';

// Bloc Takes an event and emits a state

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);
    on<PostAddEvent>(postAddEvent);
  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostState> emit) async {
    emit(LoadingState());
    List<PostDataModel> posts = await PostsRepo.fetchPost();

    emit(PostFetchingSuccessfull(posts: posts));
  }

  Future<FutureOr<void>> postAddEvent(
      PostAddEvent event, Emitter<PostState> emit) async {
    bool success = await PostsRepo.addPost();
    log("Post Added Status: $success");
    if (success) {
      emit(PostsActionSuccessState());
      log("POst Successfull");
    } else {}
  }
}
