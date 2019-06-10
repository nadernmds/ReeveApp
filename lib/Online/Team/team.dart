import 'package:reeve2/Online/Category/category.dart';
import 'package:reeve2/Online/Online.dart';
import 'package:reeve2/Online/User/user.dart';

class Team extends Online {
  Team(
      {this.about,
      this.adress,
      this.blog,
      this.creator,
      this.creatorID,
      this.slogan,
      this.teamCategories,
      this.teamID,
      this.teamLocation,
      this.teamMembers,
      this.teamName,
      this.teamSocials,
      this.verified,
      this.website});
  int teamID;
  String teamName;
  String teamLocation;
  String slogan;
  String about;
  String website;
  String adress;
  String blog;
  int creatorID;
  bool verified;
  List<TeamSocial> teamSocials;
  List<Category> teamCategories;
  List<User> teamMembers;
  Creator creator;
}

class Creator {
  Creator({this.name, this.userID});
  int userID;
  String name;
}

class TeamSocial {
  TeamSocial({this.url, this.type});
  String url;
  int type;
}
