import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_arc/base_widget.dart';
import 'package:provider_arc/core/models/comment.dart';
import 'package:provider_arc/ui/shared/app_colors.dart';
import 'package:provider_arc/ui/shared/ui_helpers.dart';
import 'package:provider_arc/viewmodels/comment_view_model.dart';

class Comments extends StatelessWidget {
  final int postId;

  Comments(this.postId);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<CommentViewModel>(
      model: CommentViewModel(Provider.of(context)),
      onModelReady: (CommentViewModel model) => model.fetchComment(postId),
      builder: (BuildContext context, CommentViewModel model, Widget child) {
        if (model.busy) {
          return CircularProgressIndicator();
        }
        return Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: model.comments.length,
            itemBuilder: (BuildContext context, int index) {
              return CommentItem(model.comments[index]);
            },
          ),
        );
      },
    );
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment comment;

  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall,
          Text(comment.body),
        ],
      ),
    );
  }
}
