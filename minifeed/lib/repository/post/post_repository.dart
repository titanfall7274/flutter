import 'package:minifeed/models/post.dart';

abstract class PostRepository {
  Future<Post?> fetchPost(String id);
  Future<List<Post>> fetchPosts({Post? after}); // 20개씩 after 이후부터

  Future<Post> createPost(String body);
}
