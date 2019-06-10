import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:reeve2/Online/Category/category.dart' as cat;
import 'package:reeve2/Online/Online.dart';
import 'package:reeve2/Online/Category/categoryProvider.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<cat.Category> items = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemBuilder: (c, i) {
        return CategoryProvider(
          category: items[i],
          child: CategoryItem(),
        );

        //  CategoryItem(
        //   category: items[i],
        // );
      },
      itemCount: items.length,
    )
    );
  }

  void getData() async {
    cat.Category c = new cat.Category();
    var res = await c.getcategories();
    setState(() {
      items = res;
    });
  }
}

class Line extends StatelessWidget {
  const Line({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      height: 1,
    );
  }
}

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: Image.network(
                  'https://www.reeve.ir/images/categoryimages/icons/' +
                      CategoryProvider.of(context)
                          .category
                          .categoryID
                          .toString() +
                      '.jpg',
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: <Widget>[TitleText(), DescriptionText()],
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.rtl,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
              FollowButton()
            ],
          ),
        ),
        Line()
      ],
    );
  }
}

class DescriptionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2),
      child: SizedBox(
        width: 186,
        child: Text(
          CategoryProvider.of(context).category.description,
          textAlign: TextAlign.start,
          textDirection: TextDirection.rtl,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      CategoryProvider.of(context).category.categoryName,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
        child: Text((CategoryProvider.of(context).category.followState
      ? 'دنبال می کنید'
      : 'دنبال کن')),
        onPressed:_clickaction,
        color: CategoryProvider.of(context).category.followState
      ? Colors.red
      : Colors.green,
        textColor: Colors.white,
      );
  }
  _clickaction () {
          if (CategoryProvider.of(context).category.followState) {
            CategoryProvider.of(context)
                .category
                .unfollow(CategoryProvider.of(context).category.categoryID)
                .then((res) {
              if (res) {
                setState(() {
                  CategoryProvider.of(context).category.followState = false;
                });
              } else {
                CategoryProvider.of(context).category.followState = true;
              }
            });
          } else {
            CategoryProvider.of(context)
                .category
                .follow(CategoryProvider.of(context).category.categoryID)
                .then((res) {
              if (res) {
                setState(() {
                  CategoryProvider.of(context).category.followState = true;
                });
              } else {
                CategoryProvider.of(context).category.followState = false;
              }
            });
          }
        }
}
