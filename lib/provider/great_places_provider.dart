
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_place_app/models/place.dart';

class GreatPlacesProvider with ChangeNotifier{
  List<Place> _items = [];

  List<Place> get Items{
    return _items;
  }

  void addPlace(String title,File pickedImage,){
    final newPlace = Place(id: DateTime.now().toString(),title: title,image: pickedImage,location: null);
    _items.add(newPlace);
    notifyListeners();
  }

}