import 'package:dio/dio.dart';
import 'package:flutter_http_app/Post.dart';

class PostRepository {
  final dio = Dio();

  PostRepository._single();

  static final PostRepository _instance = PostRepository._single();

  factory PostRepository() {
    return _instance;
  }



 Future<Post> findById(int id) async {
    Response response = await dio.get("https://jsonplaceholder.typicode.com/posts/$id");
    Post post = Post.fromJson(response.data);
    return post;
 }

  Future<List<Post>> findAll() async {
    Response response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    List<dynamic> mapList = response.data;
    List<Post> postList = mapList.map((e) => Post.fromJson(e)).toList();
    return postList;
  }

}


