import 'package:flutter/material.dart';
import 'post.dart';
import 'post_list.dart';
import 'text_input_widget.dart';

class MyHomePage extends StatefulWidget {
  final String name;

  const MyHomePage(this.name);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    setState(() {
      posts.add(Post(text, widget.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Blog page"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: PostList(posts)),
            TextInputWidget(newPost)
          ],
        ));
  }
}
