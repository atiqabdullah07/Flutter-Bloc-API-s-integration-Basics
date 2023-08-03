import 'package:blocpractice/features/posts/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostBloc postBloc = PostBloc();

  @override
  void initState() {
    super.initState();
    postBloc.add(PostsInitialFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts "),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            postBloc.add(PostAddEvent());
          }),
      body: BlocConsumer<PostBloc, PostState>(
        bloc: postBloc,
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => current is! PostActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case LoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case PostFetchingSuccessfull:
              final successState = state as PostFetchingSuccessfull;
              return ListView.builder(
                  itemCount: successState.posts.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        width: 300,
                        color: Colors.blue.shade100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              successState.posts[index].title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Text(successState.posts[index].body),
                          ],
                        ),
                      ),
                    );
                  }));
            default:
              return Container();
          }
        },
      ),
    );
  }
}
