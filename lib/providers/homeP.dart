import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeP extends ChangeNotifier {
  final BuildContext context;
  String s = "Hello";
  List<String> _imageList = [], _selectedList = [];
  List<String> get selectedList => _selectedList;

  _refreshSelectedList() {
    _selectedList = _imageList
        .where((image) => image.contains(categoryIDs[_selectedCategory]))
        .toList();
    notifyListeners();
  }

  int _selectedCategory = 0;
  int get selectedCategory => _selectedCategory;
  set selectedCategory(int selected) {
    _selectedCategory = selected;
    _refreshSelectedList();
  }

  List<String> categoryNames = [
    "Galereýa",
    "Daşky dekor",
    "Içki dekor",
    "Burçlar",
    "Lýustralar",
    "Potoloklar",
  ];
  List<String> categoryIDs = [
    "galereya",
    "dashky",
    "ichki",
    "burch",
    "lyustra",
    "potolok",
  ];

  HomeP(this.context) {
    _initImages();
  }

  Future _initImages() async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = jsonDecode(manifestContent);

    _imageList = manifestMap.keys.toList();
    _refreshSelectedList();
  }
}
