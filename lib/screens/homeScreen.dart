import 'package:flutter/material.dart';
import 'package:gradientwalls/Networking/networking.dart';
import 'package:gradientwalls/constants/contants.dart';
import 'package:gradientwalls/data/data.dart';
import 'package:gradientwalls/models/category_model.dart';
import 'package:gradientwalls/models/photomodel.dart';
import 'package:gradientwalls/screens/categoriesScreen.dart';
import 'package:gradientwalls/screens/makeGradientWallpaperScreen.dart';
import 'package:gradientwalls/widgits/category_tile.dart';
import 'package:gradientwalls/widgits/photo_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchBarController = TextEditingController();


  // i will be calling the categoriesList and a photosList
  List<CategorieModel> _categoryList;
  List<Photo> _photoList;

  _getTrendingImageList() async{
    _photoList=await getTrendingImages(query: 'Trending');
    setState(() {

    });
  }

  @override
  void initState() {
    // i will make categoryList
    _categoryList=getCategories();
    _getTrendingImageList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100,),
            FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return MakeGradientWallpaperScreen();
                  }));
                },
                child: Text(
                  'Gradient Wallpapers',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange
                  ),
                ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //Following is name
                Text(
                  'Wallpapers',
                  style: kHeadingTextStyle
                ),
                //Following is the search bar
                Container(
                  margin: EdgeInsets.all(10),
                  child: TextField(
                    controller: searchBarController,
                    enableSuggestions: true,
                    //Border Decoration
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey[100],
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal[600], width: 3.0),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                    ),
                    onSubmitted: (newValue) {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CategoriesScreen(
                          categoryName: '$newValue',
                        );
                      }));
                    },
                  ),
                ),
                //Following is the suggestions bar
                Container(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 70,
                        width: 120,
                        margin: EdgeInsets.all(4),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return CategoriesScreen(
                                categoryName: '${_categoryList[index].categorieName}',
                              );
                            }));
                          },
                          child: CategoryTile(
                            category: _categoryList[index],
                          )
                        ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      );
                    },
                  ),
                ),
                //Following is the grid of images
                Container(
                  height: MediaQuery.of(context).size.height-152,
                  child: GridView.builder(
                    itemCount: _photoList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context,index){
                      return _photoList==null?
                      GridTile(child: CircleAvatar(
                        child: CircularProgressIndicator(),
                        radius: 24,
                      )):
                      Hero(
                        transitionOnUserGestures: true,
                        tag: _photoList[index].photoId,
                        child: PhotoTile(
                          photo: _photoList[index],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}