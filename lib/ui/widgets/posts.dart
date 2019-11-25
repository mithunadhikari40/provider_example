import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/base_widget.dart';
import 'package:provider_arc/core/constants/app_contstants.dart';
import 'package:provider_arc/core/models/user.dart';
import 'package:provider_arc/ui/widgets/postlist_item.dart';
import 'package:provider_arc/viewmodels/post_view_model.dart';

class Posts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<PostViewModel>(
      model: PostViewModel(api: Provider.of(context)),
      onModelReady: (model) {
        return model.getPost(Provider.of<User>(context).id);
      },
      builder: (BuildContext context, PostViewModel model, Widget child) {
        var posts = model.posts;
        if (model.busy) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (BuildContext context, int index) {
              return PostListItem(
                post: posts[index],
                onTap: () {
                  Navigator.pushNamed(context, RoutePaths.Post,
                      arguments: posts[index]);
                },
              );
            },
          );
        }
      },
    );
  }

  const Posts({Key key}) : super(key: key);
}
