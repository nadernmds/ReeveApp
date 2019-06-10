import 'package:flutter/material.dart';
import 'package:reeve2/Login.dart';
import 'package:reeve2/Register.dart';
import 'package:reeve2/categories.dart';
import 'package:reeve2/posts.dart';
import 'package:reeve2/users.dart';
import 'package:flutter/cupertino.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: CupertinoButton.filled(
            child: Text('pep'),
            onPressed: () {
              showCupertinoDialog(
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text('pep'),actions: <Widget>[
                        CupertinoDialogAction(child: Text('pep'),onPressed: (){
                          Navigator.pop(context);
                        },isDefaultAction: true,)
                      ],
                    );
                  },
                  context: context);
            },
          ),
        ),
      ),
    );
  }
}
