import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_panning/utils/nav_utils.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/services/repository.dart';
import '../model/fetch_image_response_model.dart';
import '../model/save_image_response_model.dart';

class EditViewModel extends ChangeNotifier {
  final Repository repository = Repository();

  bool callApi = false;
  bool showLoaderForEdit = false;
  bool customize = false;
  bool showLoaderForLongUI = false;
  File? image;
  bool showPickedImage = false;
  final picker = ImagePicker();

  Future getImage(bool fromCamera) async {
    XFile? pickedFile;
    if (fromCamera) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }
    if (pickedFile != null) {
      image = File(pickedFile.path);
      changeShowPickedImage();
    }

    return image;
  }

  FetchImageResponseModel? fetchImageResponseModel;

  Future fetchImage() async {
    try {
      fetchImageResponseModel = await repository.fetchImage();
      if (fetchImageResponseModel != null) {
        changeEditLoader();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future saveImageAfterCustomized(Uint8List imageBytes) async {
    SaveImageResponseModel? response;
    try {
      response = await repository.saveCustomImage(imageBytes);
      if (response != null && response.success!) {
        changeLoaderForLong();
        return true;
      } else {
        changeLoaderForLong();
        return false;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future resizeImage(GlobalKey<State<StatefulWidget>> globalKey) async {
    changeLoaderForLong();
    final boundary =
        globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    final image = await boundary?.toImage();
    final byteData = await image?.toByteData(format: ImageByteFormat.png);
    final imageBytes = byteData?.buffer.asUint8List();
    bool res = await saveImageAfterCustomized(imageBytes!);
    return res;
  }

  void changeEditLoader() {
    showLoaderForEdit = !showLoaderForEdit;
    callApi = true;
    notifyListeners();
  }

  void changeLoaderForLong() {
    showLoaderForLongUI = !showLoaderForLongUI;
    notifyListeners();
  }

  void changeCustomize() {
    customize = !customize;
    notifyListeners();
  }

  void changeShowPickedImage() {
    showPickedImage = !showPickedImage;
    notifyListeners();
  }

  Future<bool> backPressed(BuildContext context) async {
    image = null;
    showPickedImage = false;
    Navigator.pop(context);
    return true;
  }

  void moveToImageView(BuildContext context) {
    callApi = false;
    showLoaderForEdit = true;
    customize = false;
    NavUtils.navigateToImageView(context);
  }

  void closePressed(BuildContext context) {
    showPickedImage=false;
    changeCustomize();
    Navigator.pop(context);
  }
}
