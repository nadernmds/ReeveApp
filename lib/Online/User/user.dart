import 'package:reeve2/Online/Online.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User extends Online {
  User(
      {this.userID,
      this.username,
      this.password,
      this.name,
      this.telegramID,
      this.guid,
      this.email,
      this.mobile,
      this.headline,
      this.followState});

  int userID;
  String username;
  String password;
  String name;
  String telegramID;
  String guid;
  String email;
  String mobile;
  String headline;
  bool followState;
  Future<User> login(username, password) async {
    var user = User();
    var response = await http.post('https://www.reeve.ir/api/li',
        body: {'u': username, 'p': password});
    String allSetCookie = response.headers['set-cookie'];
    if (allSetCookie != null) {
      var setCookies = allSetCookie.split(',');
      for (var setCookie in setCookies) {
        var cookies = setCookie.split(';');

        for (var cookie in cookies) {
          await saveCookie(cookie);
        }
      }
    }
    var dec = jsonDecode(response.body);
    user.guid = dec['guid'];
    user.userID = dec['userID'];
    user.email = dec['email'];
    return user;
  }

  Future<List<User>> getUsers() async {
    var res = await getUrl('Auser');
    var users = List<User>();
    var dec = jsonDecode(res.body);
    for (var item in dec) {
      users.add(User(
          userID: item['userID'],
          username: item['username'],
          password: item['password'],
          name: item['name'],
          telegramID: item['telegramID'],
          guid: item['guid'],
          email: item['email'],
          mobile: item['mobile'],
          headline: item['headline'],
          followState: item['followState']));
    }
    return users;
  }

  Future<User> getUser(int id) async {
    var res = await getUrl('Auser/' + id.toString());
    var item = jsonDecode(res.body);
    return User(
        userID: item['userID'],
        username: item['username'],
        password: item['password'],
        name: item['name'],
        telegramID: item['telegramID'],
        guid: item['guid'],
        email: item['email'],
        mobile: item['mobile'],
        headline: item['headline']);
  }

  Future<bool> follow(int id) async {
    var res = await postUrl(url: 'Auser/follow', body: {'u': id});
    return jsonDecode(res.body);
  }

  Future<bool> unfollow(int id) async {
    var res = await postUrl(url: 'Auser/unfollow', body: {'u': id});
    return jsonDecode(res.body);
  }
}
