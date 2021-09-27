import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Post {
  late String body;
  late String author;
  int likes = 0;
  bool userLiked = false;

  Post(this.body, this.author);

  void likePost() {
    userLiked = !userLiked;
    if (userLiked) {
      likes += 1;
    } else {
      likes -= 1;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iLipa app',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    setState(() {
      posts.add(Post(text, "ilipa"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hi"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: PostList(posts)),
            Expanded(child: TextInputWidget(newPost))
          ],
        ));
  }
}

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  const TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void changeText(text) {
    if (text == "Hello") {
      controller.clear();
      text = "";
    }
    setState(() {});
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.message),
            labelText: "Type a message:",
            suffixIcon: IconButton(
              onPressed: click,
              icon: Icon(Icons.send),
              splashColor: Colors.blue,
              tooltip: "Post message",
            )));
  }
}

class PostList extends StatefulWidget {
  const PostList(this.listItems);

  final List<Post> listItems;

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listItems.length,
      itemBuilder: (context, index) {
        var post = widget.listItems[index];
        return Card(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: ListTile(title: Text(post.body), subtitle: Text(post.author))),
              Row(children: <Widget>[IconButton(onPressed: post.likePost, icon: const Icon(Icons.thumb_up))],)
            ],
          ),
        );
      },
    );
  }
}
