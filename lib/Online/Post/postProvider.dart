import 'package:flutter/cupertino.dart';
import 'package:reeve2/Online/Post/post.dart';

class PostProvider extends InheritedWidget {
  final Post post;
  final Widget child;
  PostProvider({this.post, this.child});

  static PostProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(PostProvider);
  @override
  bool updateShouldNotify(PostProvider oldWidget) {
    return post != oldWidget.post;
  }
}
