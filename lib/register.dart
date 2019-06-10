import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final String value;
  Register({this.value});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  children: <Widget>[
                    Name(),
                    Email(),
                    Username(),
                    Password(),
                    RegisterButton(),
                    LoginLinkText(),
                    ForgotLinkText()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginLinkText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'ورود',
          style: TextStyle(fontSize: 16, color: Colors.blue),
        ),
      ),
    );
  }
}

class ForgotLinkText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          'اطلاعاتم یادم رفته',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      width: 150,
      height: 50,
      child: RaisedButton(
        child: Text(
          'ثبت نام',
          style: TextStyle(fontSize: 16),
        ),
        onPressed: () {
          // var route = MaterialPageRoute(builder: (c) {
          //   return Forgot(username.text);
          // });
          // Navigator.of(context).push(route);
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

class Username extends StatelessWidget {
  const Username({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        autofocus: true,
        style: TextStyle(
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'نام و نام خانوادگی',
        ),
        keyboardType: TextInputType.text,
        obscureText: false,
      ),
      margin: EdgeInsets.only(top: 20),
    );
  }
}

class Email extends StatelessWidget {
  const Email({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        autofocus: true,
        style: TextStyle(
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'ایمیل',
        ),
        keyboardType: TextInputType.emailAddress,
        obscureText: false,
      ),
      margin: EdgeInsets.only(top: 20),
    );
  }
}

class Name extends StatelessWidget {
  const Name({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        autofocus: true,
        style: TextStyle(
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'نام و نام خانوادگی',
        ),
        keyboardType: TextInputType.text,
        obscureText: false,
      ),
      margin: EdgeInsets.only(top: 20),
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
      height: 180,
      width: double.infinity,
      color: Color(0xFfe85858),
      child: Image.network('https://www.reeve.ir//Images/Billboard.png'),
    );
  }
}
