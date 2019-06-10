import 'package:flutter/material.dart';
import 'package:reeve2/Online/User/user.dart';
import 'package:reeve2/categories.dart';

import 'Login.dart';
import 'Register.dart';
import 'Forgot.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'iransans'),
      home: Login(),
    );
  }
}

var username = TextEditingController();
var password = TextEditingController();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TopLogo(),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Email(controller: username),
                    Password(),
                    LoginButton(),
                    Container(
                      height: 20,
                    ),
                    LinkText('ثبت نام', Colors.blue),
                    Container(
                      height: 20,
                    ),
                    LinkText('اطلاعاتم یادم رفته', Colors.grey),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.help),
        onPressed: () {},
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: 150,
      height: 50,
      child: RaisedButton(
        child: Text(
          'ورود',
          style: TextStyle(fontSize: 16),
        ),
        onPressed: () async {
          var user = User();
          var w = await user.login(username.text, password.text);
          var route = MaterialPageRoute(builder: (c) {
            return Category();
          });
          Navigator.of(context).push(route);
        },
        color: Colors.green,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}

class Password extends StatelessWidget {
  const Password({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: password,
        autofocus: true,
        style: TextStyle(
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'کلمه عبور',
        ),
        keyboardType: TextInputType.text,
        obscureText: true,
      ),
      margin: EdgeInsets.only(top: 20),
    );
  }
}

class Email extends StatelessWidget {
  final TextEditingController controller;
  const Email({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        fontSize: 18,
      ),
      textAlign: TextAlign.center,
      controller: controller,
      autofocus: true,
      textInputAction: TextInputAction.next,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        hintText: 'نام کاربری یا ایمیل',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class TopLogo extends StatelessWidget {
  const TopLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      color: Color(0xFfe85858),
      child: Image.network('https://www.reeve.ir//Images/Billboard.png'),
    );
  }
}

class LinkText extends StatelessWidget {
  final String text;
  final Color color;
  LinkText(this.text, this.color);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (c) {
          return Register(
            value: username.text,
          );
        }));
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 18, color: color),
      ),
    );
  }
}
