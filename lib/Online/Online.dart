import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Online {
  static const String userImage = baseurl + 'Images/UserImages/';
  static const String postImage=baseurl+'Images/PostImages/icons/';
  static const String baseurl='https://www.reeve.ir/';
  static const String url = baseurl+'api/';
  static const String a = 'ASP.NET_SessionId';
  static const String b = '.AspNet.ApplicationCookie';
  Future<http.Response> getUrl(url) async {
    return await http.get(Online.url + url,
        headers: await generateCookieHeader());
  }

  Future<http.Response> postUrl({String url, dynamic body}) async {
    return await http.post(Online.url + url,
        headers: await generateCookieHeader(), body: jsonEncode(body));
  }

  Map<String, String> headers = {"content-type": "text/json"};

  Future<Map<String, String>> generateCookieHeader() async {
    String cookie = "";
    var p = await SharedPreferences.getInstance();
    if (cookie.length > 0) cookie += ";";
    cookie += a + '=' + p.getString(a) + ';';
    cookie += b + '=' + p.getString(b) + ';';
    headers['cookie'] = cookie;
    return headers;
    // print(cookie);
  }

  Future saveCookie(String rawCookie) async {
    if (rawCookie.length > 0) {
      var keyValue = rawCookie.split('=');
      if (keyValue.length == 2) {
        var key = keyValue[0].trim();
        var value = keyValue[1];
        // ignore keys that aren't cookies
        if (key == 'path' || key == 'expires') return;
        var p = await SharedPreferences.getInstance();
        p.setString(key, value);
      }
    }
  }
}
