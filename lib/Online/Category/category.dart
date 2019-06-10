import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:reeve2/Online/Online.dart';

class Category extends Online {
  Category(
      {this.categoryID, this.categoryName, this.description, this.followState});
  int categoryID;
  String categoryName;
  String description;
  bool followState;

  Future<List<Category>> getcategories() async {
    var s = await getUrl('acategory/all');
    var categories = new List<Category>();

    for (var item in jsonDecode(s.body)) {
      categories.add(Category(
          categoryID: item['categoryID'],
          categoryName: item['categoryName'],
          description: item['description'],
          followState: item['followState'])); 
    }
    return categories;
  }
    Future<bool> follow(int id) async {
    var res =await postUrl(url: 'ACategory/follow', body: {'c': id});
    return jsonDecode(res.body);
  }

  Future<bool> unfollow(int id) async {
    var res =await postUrl(url: 'ACategory/unfollow', body: {'c': id});
    return jsonDecode(res.body);
  }
}
