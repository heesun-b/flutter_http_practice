import 'package:flutter/material.dart';
import 'package:flutter_http_app/Post.dart';
import 'package:flutter_http_app/post_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build 실행");
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: PostRepository().findById(1), // 다운 받을 데이터
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Post post = snapshot.data!;
                    print("데이터 o");
                    return Center(
                        child: Text(
                      '${post.title}',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),);
                  } else {
                    print("데이터 x");
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: PostRepository().findAll(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Post> postList = snapshot.data!;

                    return ListView.separated(
                      itemCount: postList.length,
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.blue,
                          height: 1,
                          thickness: 1,
                        );
                      },
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.check),
                          title: Text("${postList[index].title}"),
                          subtitle: Text("${postList[index].body}"),
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
