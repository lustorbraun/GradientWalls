import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gradientwalls/constants/contants.dart';
import 'package:gradientwalls/models/photomodel.dart';
import 'package:http/http.dart'as http;

Future<List<Photo>> getTrendingImages({@required String query})async{
  List<Photo> photoList=[];
  await http.get(
      "https://pixabay.com/api/?key=$apiKey&q=$query&image_type=photo&pretty=true").then((httpResponse){
        //the httpResponse.body will give a rawJson
        print(httpResponse.body.toString());
        Map<String,dynamic> searchResultsParsedJson=jsonDecode(httpResponse.body);
        List<dynamic> photosParsedJsonList=searchResultsParsedJson["hits"];
        photoList=[];
        photosParsedJsonList.forEach((photoParsedJson) {
          Photo photo=Photo.fromJson(photoParsedJson);
          photoList.add(photo);
        });
  });
  return photoList;
}