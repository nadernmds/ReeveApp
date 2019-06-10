import 'package:flutter/material.dart';
import 'package:reeve2/Online/Online.dart';
import 'package:reeve2/Online/User/user.dart';
import 'package:reeve2/Online/User/userProvider.dart';
import 'package:transparent_image/transparent_image.dart';

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<User> items = [];
  @override
  void initState() {
    super.initState();
    getusers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      itemBuilder: (context, i) {
        return UserProvider(
          user: items[i],
          child: UserItem(),
        );
      },
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.62),
      shrinkWrap: false,
    ));
  }

  void getusers() async {
    var s = await (new User()).getUsers();
    setState(() {
      items = s;
    });
  }
}

class UserItem extends StatelessWidget {
  const UserItem({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FadeInImage.assetNetwork(
            image: Online.userImage +
                UserProvider.of(context).user.userID.toString() +
                '.jpg',
            placeholder: 'assets/loading.gif',
            fadeInDuration: Duration(milliseconds: 100),
            height: 180,
            fit: BoxFit.cover,
          ),
          Text(
            UserProvider.of(context).user.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            UserProvider.of(context).user.headline,
            textAlign: TextAlign.center,
          ),
          FollowButton()
        ],
      ),
    );
  }
}

class FollowButton extends StatefulWidget {
  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text((UserProvider.of(context).user.followState
          ? 'دنبال می کنید'
          : 'دنبال کن')),
      onPressed: _clickaction,
      color:
          UserProvider.of(context).user.followState ? Colors.red : Colors.green,
      textColor: Colors.white,
    );
  }

  _clickaction() {
    if (UserProvider.of(context).user.followState) {
      UserProvider.of(context)
          .user
          .unfollow(UserProvider.of(context).user.userID)
          .then((res) {
        if (res) {
          setState(() {
            UserProvider.of(context).user.followState = false;
          });
        } else {
          UserProvider.of(context).user.followState = true;
        }
      });
    } else {
      UserProvider.of(context)
          .user
          .follow(UserProvider.of(context).user.userID)
          .then((res) {

        if (res) {
          setState(() {
            UserProvider.of(context).user.followState = true;
          });
        } else {
          UserProvider.of(context).user.followState = false;
        }
      });
    }
  }
}
