import 'package:flutter/cupertino.dart';

import 'user.dart';

class UserProvider extends InheritedWidget {
  final User user;
  final Widget child;
  UserProvider({this.user, this.child});

  static UserProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(UserProvider);
  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return user != oldWidget.user;
  }
}