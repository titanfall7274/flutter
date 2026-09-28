import 'package:minifeed/models/comment.dart';

abstract class CommentRepository {
  Future<Comment?> fetchComment(String id);
  // postId 게시글의 댓글을 20개씩 after 이후부터
  Future<List<Comment>> fetchComments(String postId, {Comment? after});

  Future<Comment> createComment(String postId, String body);
}
