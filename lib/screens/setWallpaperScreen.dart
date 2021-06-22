import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:gradientwalls/models/photomodel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

class SetWallpaperScreen extends StatefulWidget {
  final Photo photo;
  SetWallpaperScreen({@required this.photo});
  @override
  _SetWallpaperScreenState createState() => _SetWallpaperScreenState();
}

class _SetWallpaperScreenState extends State<SetWallpaperScreen> {
  bool isDownloadClicked;
  bool isDownloaded;
  bool isWallpaperSetClicked;
  bool isWallpaperSetted;

  @override
  void initState() {
    // i will make categoryList
    isDownloadClicked=false;
    isDownloaded=false;
    isWallpaperSetClicked=false;
    isWallpaperSetted=false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Hero(
              transitionOnUserGestures: true,
              tag: widget.photo.photoId,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  widget.photo.photoLargeImageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 125,
              right: 5,
              child: GestureDetector(
                onTap: isDownloadClicked?
                    (){}:
                    ()async{
                  setState(() {
                    isDownloadClicked=true;
                  });
                  final status=await Permission.storage.request();

                  if (status.isGranted){

                    Directory appDocDir = await getExternalStorageDirectory();
                    await FlutterDownloader.enqueue(
                      url: widget.photo.photoHDURL,
                      savedDir: appDocDir.path,
                      showNotification: true,
                      openFileFromNotification: true,
                      fileName: '${widget.photo.photoId}'
                    );
                  }
                  setState(() {
                    isDownloaded=true;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.only(bottom: 50),
                  child: Text(
                    isDownloaded?"Downloaded":'Download Wallpaper',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 75,
              right: 5,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: isWallpaperSetClicked?
                        (){}:
                        ()async{
                      setState(() {
                        isDownloadClicked=true;
                        isWallpaperSetClicked=true;
                      });
                      final status=await Permission.storage.request();

                      if (status.isGranted){

                        Directory appDocDir = await getExternalStorageDirectory();
                        await FlutterDownloader.enqueue(
                            url: widget.photo.photoHDURL,
                            savedDir: appDocDir.path,
                            showNotification: true,
                            openFileFromNotification: true,
                            fileName: '${widget.photo.photoId}'
                        );
                        await WallpaperManager.setWallpaperFromFile("${appDocDir.path}/${widget.photo.photoId}", WallpaperManager.HOME_SCREEN);
                        await WallpaperManager.setWallpaperFromFile("${appDocDir.path}/${widget.photo.photoId}", WallpaperManager.HOME_SCREEN);
                        setState(() {
                            isDownloaded=true;
                            isWallpaperSetted=true;
                        });
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      margin: EdgeInsets.only(bottom: 50),
                      child: Text(
                        isWallpaperSetted?"Wallpaper Setted":'Set Wallpaper',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: Colors.white38,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        child: Text('Uploaded by : ${widget.photo.photographer}'
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
