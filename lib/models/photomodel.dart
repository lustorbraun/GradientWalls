
class Photo{
 int photoId;
 int photoWidth;
 int photoHeight;
 String photoURL;
 String photoHDURL;
 String photoPreviewURL;
 int photoDownloads;
 int photoviews;
 String photographer;
 String photographerURL;
 String photoLargeImageURL;
 int photoPreviewWidth;
 int photoPreviewHeight;
 int photoLikes;

 Photo({
   this.photoHeight,
   this.photoId,
   this.photoURL,
   this.photoWidth,
   this.photographer,
   this.photographerURL,
   this.photoDownloads,
   this.photoHDURL,
   this.photoviews,
   this.photoPreviewURL,
   this.photoLargeImageURL,
   this.photoPreviewHeight,
   this.photoPreviewWidth,
   this.photoLikes,
 });

 factory Photo.fromJson(Map parsedJson){
   return Photo(
     photoId: parsedJson["id"],
     photoHeight: parsedJson['imageHeight'],
     photoWidth: parsedJson['imageWidth'],
     photoURL: parsedJson['imageURL'],
     photographer: parsedJson['user'],
     photographerURL: parsedJson['userImageURL'],
     photoDownloads: parsedJson['downloads'],
     photoviews: parsedJson['views'],
     photoHDURL: parsedJson['fullHDURL'],
     photoPreviewURL: parsedJson['previewURL'],
     photoLargeImageURL: parsedJson['largeImageURL'],
     photoPreviewHeight: parsedJson['previewHeight'],
     photoPreviewWidth: parsedJson['previewWidth'],
     photoLikes: parsedJson['likes']
   );
 }

}