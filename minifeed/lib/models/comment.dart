// 게시글 상세에 보일 댓글이 포함하는 요소들
class Comment {
  final String id;
  final String postId; // 댓글이 달린 게시글 ID
  final String authorId; // 작성자 익명 ID
  final String nickName; // 닉네임

  final int colorIndex; // 유저 아바타 색상

  final String body; // 댓글 본문
  final DateTime createdAt; // 작성 시간

  const Comment({
    required this.id,
    required this.postId,
    required this.authorId,
    required this.nickName,

    required this.colorIndex,

    required this.body,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json["id"],
      postId: json["postId"],
      authorId: json["authorId"],
      nickName: json["nickName"],
      colorIndex: json["colorIndex"],
      body: json["body"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }
}
