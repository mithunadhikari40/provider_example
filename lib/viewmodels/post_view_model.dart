import 'package:flutter/cupertino.dart';
import 'package:provider_arc/core/models/post.dart';
import 'package:provider_arc/core/services/api.dart';
import 'package:provider_arc/viewmodels/base_model.dart';

class PostViewModel extends BaseModel {
  Api _api;

  PostViewModel({@required Api api}) : _api = api;

  List<Post> _posts;

  List<Post> get posts => List.from(_posts);

  Future getPost(int userId) async {
    setBusy(true);
    _posts = await _api.getPostsForUser(userId);
    setBusy(false);
  }
}
