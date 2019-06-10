import 'package:http/http.dart' as http;
import 'package:reeve2/Online/Category/category.dart';
import 'dart:convert';
import 'package:reeve2/Online/Online.dart';
import 'package:reeve2/Online/Team/team.dart';

class Post extends Online {
  Post(
      {this.postID,
      this.name,
      this.shortDescription,
      this.fullDescription,
      this.longDescription,
      this.feautured,
      this.hunterID,
      this.mainCategoryID,
      this.liked,
      this.comments,
      this.saved,
      this.saves,
      this.categories,
      this.makers,
      this.teams,
      this.hunter,
      this.gettingoptions,
      this.likes,
      this.makerExpanded});
  int postID;
  String name;
  String shortDescription;
  String fullDescription;
  String longDescription;
  String feautured;
  int hunterID;
  int mainCategoryID;
  bool liked;
  bool makerExpanded = false;
  int likes;
  int comments;
  int saves;
  bool saved;
  List<Category> categories;
  List<Maker> makers;
  List<GettingOption> gettingoptions;
  List<Team> teams;
  Hunter hunter;
  List<MakersOfProduct> getMakers(){
    var list=<MakersOfProduct>[];
    list.add(MakersOfProduct(id: hunter.userID,name: hunter.name,type: 0));
    for (var item in makers) {
      list.add(MakersOfProduct(id:item.userID,name:item.name,type:1));
    }
        for (var item in teams) {
      list.add(MakersOfProduct(id:item.teamID ,name:item.teamName,type:2));
    }
    return list;
  }

  Future<Post> getPost(int id) async {
    var res = await getUrl('apost/' + id.toString());
    var postItem = jsonDecode(res.body);
    Post post = new Post();
    for (var category in postItem['categories']) {
      post.categories.add(Category(
          categoryID: category['categoryID'],
          categoryName: category['categoryName'],
          description: category['description']));
    }
    for (var gettingoption in postItem['Gettingoptions']) {
      post.gettingoptions.add(GettingOption(
          url: gettingoption['url'],
          gettingOptionTypeID: gettingoption['gettingOptionTypeID'],
          gettingType: gettingoption['gettingType']));
    }
    for (var maker in postItem['makers']) {
      post.makers.add(Maker(userID: maker['userID'], name: maker['name']));
    }
    for (var team in postItem['teams']) {
      post.teams.add(Team(teamID: team['teamID'], teamName: team['teamName']));
    }
    post.hunter = Hunter(userID: postItem['userID'], name: postItem['name']);
    post.postID = postItem['postID'];
    post.name = postItem['name'];
    post.shortDescription = postItem['shortDescription'];
    post.feautured = postItem['feautured'];
    post.liked = postItem['liked'];
    post.saved = postItem['saved'];
    post.likes = postItem['likes'];
    post.comments = postItem['comments'];
    post.saves = postItem['saves'];
    return post;
  }

  Future<List<Post>> getPosts() async {
    var res = await getUrl('apost');
    var dec = jsonDecode(res.body);
    var posts = new List<Post>();

    for (var postItem in dec) {
      Post post = new Post();
      post.categories = <Category>[];
      post.gettingoptions = [];
      post.makers = [];
      post.teams = [];
      for (var category in postItem['categories']) {
        post.categories.add(Category(
            categoryID: category['categoryID'],
            categoryName: category['categoryName'],
            description: category['description']));
      }
      for (var gettingoption in postItem['Gettingoptions']) {
        post.gettingoptions.add(GettingOption(
            url: gettingoption['url'],
            gettingOptionTypeID: gettingoption['gettingOptionTypeID'],
            gettingType: gettingoption['gettingType']));
      }
      for (var maker in postItem['makers']) {
        post.makers.add(Maker(userID: maker['userID'], name: maker['name']));
      }
      for (var team in postItem['teams']) {
        post.teams
            .add(Team(teamID: team['teamID'], teamName: team['teamName']));
      }
      post.hunter = Hunter(userID: postItem['hunter']['userID'], name: postItem['hunter']['name']);
      post.postID = postItem['postID'];
      post.name = postItem['name'];
      post.shortDescription = postItem['shortDescription'];
      post.feautured = postItem['feautured'];
      post.liked = postItem['liked'];
      post.saved = postItem['saved'];
      post.likes = postItem['likes'];
      post.comments = postItem['comments'];
      post.saves = postItem['saves'];
      posts.add(post);
    }
    return posts;
  }
}

class Maker {
  Maker({this.name, this.userID});
  int userID;
  String name;
}

class Hunter {
  Hunter({this.userID, this.name});
  int userID;
  String name;
}

class GettingOption {
  GettingOption({this.url, this.gettingOptionTypeID, this.gettingType});
  String gettingType;
  String url;
  int gettingOptionTypeID;
}

class MakersOfProduct {
  MakersOfProduct({this.name,this.id,this.type});
  int id;
  String name;
  int type;
}
