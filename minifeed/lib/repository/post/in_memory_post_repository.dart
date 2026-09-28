import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:minifeed/models/post.dart';
import 'package:minifeed/repository/post/post_repository.dart';

class InMemoryPostRepository extends PostRepository {
  List<Post>? _posts;

  Future<List<Post>> _loadAll() {
    // 이미 로드되어 있는 경우
    if (_posts != null) {
      return Future.value(_posts);
    }

    return rootBundle
        .loadString("assests/dummy/post/posts.json")
        .then(_parseAndKeep);
  }

  List<Post> _parseAndKeep(String text) {
    final List<dynamic> jsonList = jsonDecode(text);

    final List<Post> posts = [];
    for (var json in jsonList) {
      posts.add(Post.fromJson(json));
    }
    _posts = posts; // 저장

    return posts;
  }

  @override
  Future<List<Post>> fetchPosts({Post? after}) {
    return _loadAll().then((posts) => _page(posts, after));
  }

  List<Post> _page(List<Post> posts, Post? after) {
    int start = 0;
    if (after != null) {
      for (int i = 0; i < posts.length; i++) {
        if (posts[i].id == after.id) {
          start = i + 1;
          break;
        }
      }
    }

    final List<Post> result = [];
    for (int i = start; i < posts.length && result.length < 20; i++) {
      result.add(posts[i]);
    }
    return result;
  }

  @override
  Future<Post?> fetchPost(String id) {
    return _loadAll().then((posts) => _findById(posts, id));
  }

  Post? _findById(List<Post> posts, String id) {
    for (var post in posts) {
      if (post.id == id) {
        return post;
      }
    }
    return null;
  }

  static const _myId = "user-me";
  static const _myNikcName = "처음 온 펭귄";
  static const _myColorIndex = 4;

  int _nextId = 51;

  @override
  Future<Post> createPost(String body) async {
    final posts = await _loadAll();

    final post = Post(
      id: 'post-$_nextId',
      authorId: _myId,
      nickName: _myNikcName,
      colorIndex: _myColorIndex,
      body: body,
      createdAt: DateTime.now(),
      likeCount: 0,
      commentCount: 0,
      likedByMe: false,
    );
    _nextId++;

    posts.insert(0, post);

    return post;
  }
}
