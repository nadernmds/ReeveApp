import 'package:flutter/material.dart';
import 'package:reeve2/Online/Category/category.dart';

class CategoryProvider extends InheritedWidget {
  final Category category;
  final Widget child;
  CategoryProvider({this.category, this.child});

  static CategoryProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CategoryProvider);
  @override
  bool updateShouldNotify(CategoryProvider oldWidget) {
    return category != oldWidget.category;
  }
}
