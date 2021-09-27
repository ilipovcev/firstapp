import 'package:flutter/material.dart';
import 'post.dart';

class PostList extends StatefulWidget {
  const PostList(this.listItems);

  final List<Post> listItems;

  @override
  _PostListState createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  void like(Function callBack) {
    setState(() {
      callBack();
    });
  }

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
                  child: ListTile(
                      title: Text(post.body), subtitle: Text(post.author))),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => like(post.likePost),
                    icon: const Icon(Icons.thumb_up),
                    color: post.userLiked ? Colors.green : Colors.black,
                  ),
                  Container(
                    child: Text(post.likes.toString(),
                        style: const TextStyle(fontSize: 20)),
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}