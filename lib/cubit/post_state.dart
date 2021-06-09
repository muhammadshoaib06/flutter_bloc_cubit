part of 'post_cubit.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoaded extends PostState {
  final List<Post> post;

  PostLoaded({this.post});
}

class PostErrorState extends PostState {
  final message;

  PostErrorState({this.message});
}
