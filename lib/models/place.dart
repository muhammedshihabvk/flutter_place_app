import 'dart:io';

class Place{
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;
  Place({this.id,this.title,this.image,this.location});
}

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;
  PlaceLocation({this.latitude,this.longitude,this.address});
}