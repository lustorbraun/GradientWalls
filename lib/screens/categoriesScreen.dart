import 'package:flutter/material.dart';
import 'package:gradientwalls/Networking/networking.dart';
import 'package:gradientwalls/constants/contants.dart';
import 'package:gradientwalls/models/photomodel.dart';
import 'package:gradientwalls/screens/setWallpaperScreen.dart';
import 'package:gradientwalls/widgits/photo_tile.dart';

class CategoriesScreen extends StatefulWidget {
  final String categoryName;
  CategoriesScreen({@required this.categoryName});
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Photo> _photosList=[];

  _getCategoryImageList()async{
    _photosList=await getTrendingImages(query: "${widget.categoryName}");
    setState(() {

    });
}


  @override
  void initState() {
    _getCategoryImageList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                widget.categoryName,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height-30,
                child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                itemBuilder: (context,int index){
                    return _photosList==null?
                    GridTile(child: CircularProgressIndicator()):
                    Hero(
                      transitionOnUserGestures: true,
                      tag: _photosList[index].photoId,
                      child: PhotoTile(
                        photo: _photosList[index],
                      ),
                    );
                },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
