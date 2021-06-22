import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradientwalls/models/photomodel.dart';
import 'package:gradientwalls/screens/setWallpaperScreen.dart';
import 'package:gradientwalls/widgits/counter_tile.dart';

// now making a stless widget for the phototile

class PhotoTile extends StatelessWidget {
  // we need to get photoModel
  Photo photo;
  PhotoTile({this.photo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SetWallpaperScreen(photo: photo);
        }));
      },
      child: Container(
        height: (MediaQuery.of(context).size.width*0.22),
        width: (MediaQuery.of(context).size.width*0.5),
        margin: EdgeInsets.all(4),
        child: Stack(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.width),
              width: (MediaQuery.of(context).size.width*0.5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.network(
                  photo.photoLargeImageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 8,
              child: Card(
                color: Colors.white38,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: <Widget>[
                    SizedBox(width: 4,),
                    counterTile(
                      iconToShow: Icons.file_download,
                      valueToShow: photo.photoDownloads,
                    ),
                    SizedBox(width: 4,),
                    counterTile(
                      iconToShow: Icons.remove_red_eye,
                      valueToShow: photo.photoviews,
                    ),
                    SizedBox(width: 4,),
                    counterTile(
                      iconToShow: Icons.favorite_border,
                      valueToShow: photo.photoLikes,
                    ),
                    SizedBox(width: 4,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
