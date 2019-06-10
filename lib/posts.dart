import 'package:flutter/material.dart';
import 'package:reeve2/Online/Online.dart';
import 'package:reeve2/Online/Post/post.dart';
import 'package:reeve2/Online/Post/postProvider.dart';

Post x(BuildContext context) {
  return PostProvider.of(context).post;
}

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: new Post().getPosts(),
      builder: (c, s) {
        if (s.connectionState == ConnectionState.done) {
          return ListView.builder(
            itemCount: s.data.length,
            itemBuilder: (c, i) {
              return PostProvider(
                post: s.data[i],
                child: PostItem(),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}

class PostItem extends StatelessWidget {
  const PostItem({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(
          Online.postImage + x(context).postID.toString() + '.jpg',
          height: 200,
          width: double.infinity,
          fit: BoxFit.contain,
        ),
        LikeCommentRow(),
        LikeCommentCountText(),
        Title(),
        Decription(),
        ExpansionTile(
          title: null,
          children: <Widget>[
            Wrap(
                textDirection: TextDirection.rtl,
                children: x(context)
                    .categories
                    .map((f) => CategoryChip(chipText: f.categoryName))
                    .toList()),
            Wrap(
              //معرفین
              textDirection: TextDirection.rtl,
              children: x(context)
                  .getMakers()
                  .map((f) => UserItem(maker: f))
                  .toList(),
            )
          ],
        )
      ],
    );
  }
}

class UserItem extends StatelessWidget {
  final MakersOfProduct maker;
  UserItem({
    Key key,
    this.maker,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(_getType(maker.id), style: TextStyle(color: Colors.grey, fontSize: 10)),
          ClipRRect(
            child: Image.network(
              'https://www.reeve.ir/Images/UserImages/1.jpg',
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(45),
          ),
          Text(
            maker.name,
            style: TextStyle(color: Colors.grey, fontSize: 11),
          )
        ],
      ),
    );
  }

  String _getType(int id) {
    switch (id) {
      case 0:
        return 'معرف';
      case 1:
        return 'سازنده';
      case 2:
        return 'تیم';
      default:
      return '';
    }
  }
}

class CategoryChip extends StatelessWidget {
  final String chipText;

  const CategoryChip({Key key, this.chipText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        chipText,
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.grey.withOpacity(0.25),
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Text(
            x(context).name,
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 18),
          )
        ],
      ),
    );
  }
}

class Decription extends StatelessWidget {
  const Decription({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Text(
            x(context).shortDescription,
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Colors.black26,
                fontWeight: FontWeight.bold,
                fontSize: 14),
          )
        ],
      ),
    );
  }
}

class LikeCommentCountText extends StatelessWidget {
  const LikeCommentCountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
      child: Row(
        textDirection: TextDirection.rtl,
        children: <Widget>[
          Text(
            x(context).likes.toString() +
                ' لایک و ' +
                x(context).comments.toString() +
                ' نظر',
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}

class LikeCommentRow extends StatelessWidget {
  const LikeCommentRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        textDirection: TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            textDirection: TextDirection.rtl,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Icon(
                  Icons.favorite,
                  size: 35,
                  color: Colors.red,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Icon(
                  Icons.comment,
                  size: 35,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Icon(
                  Icons.bookmark,
                  size: 35,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Icon(
                  Icons.file_download,
                  size: 35,
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
