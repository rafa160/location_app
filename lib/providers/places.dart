import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:locationapp/database/db_util.dart';
import 'package:locationapp/models/place.dart';

class Places with ChangeNotifier{

  List<Place> _items = [];

  Future<void> loadPlaces() async {
    final list = await DbUtil.getData('place');
    _items = list.map((item)=> Place(
      id: item['id'],
      title: item['title'],
      image: File(item['image']),
      location: null,
    )).toList();
    notifyListeners();
  }

  List<Place> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Place getItem(int index){
    return _items[index];
  }

  void addPlace(String title, File image){
    final newPlace = Place(
      id: Random().nextDouble().toString(),
      title: title,
      image: image,
      location: null
    );

    _items.add(newPlace);

    DbUtil.insert('place', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });

    notifyListeners();
  }
}