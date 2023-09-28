import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CustomizeDataModel{
  bool callApi = false;
  bool showLoaderForEdit = false;
  bool customize = false;
  bool showLoaderForLongUI = false;
  bool showPickedImage = false;
  File? image;
  final ImagePicker picker = ImagePicker();
}