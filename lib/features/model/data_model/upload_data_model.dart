import 'dart:io';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UploadEditDataModel{
  File? image;
  final picker = ImagePicker();
  String imagePath='';
  CroppedFile? finalCroppedFile;
  bool showLoader=false;
}