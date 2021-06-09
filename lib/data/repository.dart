import 'model/model.dart';
import 'network_service.dart';

class Repository {
  final NetworkService networkService;

  Repository({this.networkService});

  Future<List<Post>> fetchPost() async {
    final post = await networkService.fetchPost();
    return post.map((e) => Post.fromJson(e)).toList();
  }
}
