import 'dart:io';

import 'package:flutter/foundation.dart';

class ImageModel{
  final File img;
  ImageModel({required this.img});
}

ValueNotifier<List> imageListNotifier = ValueNotifier([]);

void addImage(ImageModel value){
  imageListNotifier.value.add(value);
  imageListNotifier.notifyListeners();
}