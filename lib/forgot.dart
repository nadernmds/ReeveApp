import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  final String value;

  Forgot(this.value);
  @override
  _ForgotState createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
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
                  children: <Widget>[],
                ),
              ),
            )
          ],
        ),
      ),
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
