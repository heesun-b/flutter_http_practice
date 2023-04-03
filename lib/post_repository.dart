import 'package:dio/dio.dart';

class PostRepository {
  final dio = Dio();

 Future<void> findById(int id) async {
    Response response = await dio.get("https://jsonplaceholder.typicode.com/posts/$id");
    Map<String, dynamic> responseMap = response.data;

    print(responseMap['userId']);
  }

  Future<void> findAll() async {
    Response response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    print(response.data);
  }

}


