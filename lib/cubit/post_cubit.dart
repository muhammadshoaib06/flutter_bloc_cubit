import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/data/model/model.dart';
import 'package:flutter_cubit/data/repository.dart';
import 'package:meta/meta.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit({this.repository}) : super(PostInitial());

  final Repository repository;

  Future<List<Post>> fetchPost() async {
    try {
      emit(PostInitial());

      repository.fetchPost().then((posts) {
        if (posts != null) {
          emit(PostLoaded(post: posts));
        } else {
          emit(PostErrorState(message: "Error while fetching Posts"));
        }
      });
    } catch (e) {
      print("Try Catch000");
      print(e);
      emit(PostErrorState(message: e.toString()));
    }
  }
}
