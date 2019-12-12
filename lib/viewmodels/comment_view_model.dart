import 'package:provider_arc/core/models/comment.dart';
import 'package:provider_arc/core/services/api.dart';
import 'package:provider_arc/viewmodels/base_model.dart';

class CommentViewModel extends BaseModel {
  Api _api;

  CommentViewModel(this._api);

  List<Comment> _comments =[];

  Future fetchComment(int postId) async {
    setBusy(true);
    _comments = await _api.getCommentsForPost(postId);
    setBusy(false);
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Comment> get comments => List.from(_comments);
}
