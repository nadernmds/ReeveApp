import 'package:flutter/material.dart';
import 'package:reeve2/Login.dart';
import 'package:reeve2/Online/Pep/home.dart';
import 'package:reeve2/categories.dart';
import 'package:reeve2/posts.dart';
import 'package:reeve2/test.dart';
import 'package:reeve2/users.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Online/Online.dart';
import 'Online/User/user.dart' as us;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'iransans'),
        home: Selector());
  }
}

class Selector extends StatefulWidget {
  const Selector({
    Key key,
  }) : super(key: key);
  @override
  _SelectorState createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
  Widget w = Container();
  @override
  void initState() {
    super.initState();
    select();
  }

  select() async {
    var s = await SharedPreferences.getInstance();
    if (s.getString(Online.a) != null) {
      setState(() {
        w = Posts();
      });
      }
      else{
      setState(() {
        w = Login();
      });
      }

      
    }
  

  @override
  Widget build(BuildContext context) {
    return w;    
  }
}
