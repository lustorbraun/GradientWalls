import 'package:flutter/material.dart';
import 'package:gradientwalls/models/category_model.dart';

//making stless widget for category tile

class CategoryTile extends StatelessWidget {
  // we need to get imageURL,category name, we will get it by category model
  CategorieModel category;
  CategoryTile({this.category});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 70,
          width: 120,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              category.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            '${category.categorieName}',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900
            ),
          ),
        )  ,
      ],
    );
  }
}
