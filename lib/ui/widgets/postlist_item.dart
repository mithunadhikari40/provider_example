import 'package:flutter/material.dart';
import 'package:provider_arc/core/models/post.dart';
import 'package:provider_arc/ui/widgets/comments.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  final Function onTap;

  const PostListItem({@required this.post, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3.0,
                  offset: Offset(0.0, 2.0),
                  color: Color.fromARGB(80, 0, 0, 0))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              post.title,
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16.0),
            ),
            Text(post.body, maxLines: 2, overflow: TextOverflow.ellipsis),
//            Comments(post.id),
          ],
        ),
      ),
    );
  }
}
