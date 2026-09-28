// 실제 앱에 보일 글이 포함하는 요소들
class Post {
  final String id;
  final String authorId; // 작성자 익명 ID
  final String nickName; // 닉네임

  final int colorIndex; // 유저 아바타 색상

  final String body; // 글 본문
  final DateTime createdAt; // 작성 시간
  final int likeCount; // 좋아요 수
  final int commentCount; // 댓글 수
  final bool likedByMe; // 내가 좋아요를 눌렀는지 여부

  const Post({
    required this.id,
    required this.authorId,
    required this.nickName,

    required this.colorIndex,

    required this.body,
    required this.createdAt,
    required this.likeCount,
    required this.commentCount,
    required this.likedByMe,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json["id"],
      authorId: json["authorId"],
      nickName: json["nickName"],
      colorIndex: json["colorIndex"],
      body: json["body"],
      createdAt: DateTime.parse(json["createdAt"]),
      likeCount: json["likedCount"],
      commentCount: json["commentCount"],
      likedByMe: json["likedByMe"],
    );
  }
}
