import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:minifeed/models/comment.dart';
import 'package:minifeed/repository/comment/comment_repository.dart';

class InMemoryCommentRepository extends CommentRepository {
  List<Comment>? _comments;

  Future<List<Comment>> _loadAll() {
    if (_comments != null) {
      return Future.value(_comments);
    }
    return rootBundle
        .loadString(
          "assets/dummy/comment/comments.json",
        )
        .then(_parseAndKeep);
  }

  List<Comment> _parseAndKeep(String text) {
    List<dynamic> jsonList = jsonDecode(text);

    List<Comment> comments = [];
    for (var json in jsonList) {
      comments.add(Comment.fromJson(json));
    }
    _comments = comments;

    return comments;
  }

  @override
  Future<Comment?> fetchComment(String id) {
    return _loadAll().then((comments) => _findById(comments, id));
  }

  Comment? _findById(List<Comment> comments, String id) {
    for (var comment in comments) {
      if (comment.id == id) {
        return comment;
      }
    }
    return null;
  }

  @override
  Future<List<Comment>> fetchComments(String postId, {Comment? after}) {
    return _loadAll().then((comments) => _page(comments, postId, after));
  }

  List<Comment> _page(List<Comment> all, String postId, Comment? after) {
    // 이 게시글의 댓글만 골라낸다
    final List<Comment> comments = [];
    for (var comment in all) {
      if (comment.postId == postId) {
        comments.add(comment);
      }
    }

    int start = 0;
    if (after != null) {
      for (int i = 0; i < comments.length; i++) {
        if (after.id == comments[i].id) {
          start = i + 1;
          break;
        }
      }
    }

    final List<Comment> result = [];
    for (int i = start; i < comments.length && result.length < 20; i++) {
      result.add(comments[i]);
    }

    return result;
  }

  // MP1엔 로그인이 없어서 "나"를 고정해 둔다. InMemoryPostRepository와 같은 값
  static const _myId = "user-me";
  static const _myNickName = "처음 온 펭귄";
  static const _myColorIndex = 4;

  int _nextId = 1; // 새 댓글 ID 번호. 더미 댓글 ID(post-01-c1 형식)와 겹치지 않게 따로 센다

  @override
  Future<Comment> createComment(String postId, String body) async {
    final comments = await _loadAll();

    final comment = Comment(
      id: "comment-$_nextId",
      postId: postId,
      authorId: _myId,
      nickName: _myNickName,
      colorIndex: _myColorIndex,
      body: body,
      createdAt: DateTime.now(),
    );
    _nextId++;

    // 댓글은 오래된 순이라 맨 뒤에
    comments.add(comment);

    return comment;
  }
}
