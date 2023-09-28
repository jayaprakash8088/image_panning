import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_panning/features/model/data_model/customize_data_model.dart';
import 'package:image_panning/utils/nav_utils.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/services/repository.dart';
import '../model/fetch_image_response_model.dart';
import '../model/save_image_response_model.dart';

class EditViewModel extends ChangeNotifier {
  final CustomizeDataModel customizeDataModel=CustomizeDataModel();
  final Repository repository = Repository();
  bool get callApi => customizeDataModel.callApi;
  bool get showLoaderForEdit =>customizeDataModel.showLoaderForEdit;
  bool get customize =>customizeDataModel.customize;
  bool get showLoaderForLongUI =>customizeDataModel.showLoaderForLongUI;
  File? get  image=>customizeDataModel.image;
  bool get showPickedImage =>customizeDataModel.showPickedImage;
  ImagePicker get  picker =>customizeDataModel.picker;

  Future getImage(bool fromCamera) async {
    XFile? pickedFile;
    if (fromCamera) {
      pickedFile = await picker.pickImage(source: ImageSource.camera);
    } else {
      pickedFile = await picker.pickImage(source: ImageSource.gallery);
    }
    if (pickedFile != null) {
      customizeDataModel.image = File(pickedFile.path);
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
    customizeDataModel.showLoaderForEdit = !customizeDataModel.showLoaderForEdit;
    customizeDataModel.callApi = true;
    notifyListeners();
  }

  void changeLoaderForLong() {
    customizeDataModel.showLoaderForLongUI = !customizeDataModel.showLoaderForLongUI;
    notifyListeners();
  }

  void changeCustomize() {
    customizeDataModel.customize = !customizeDataModel.customize;
    notifyListeners();
  }

  void changeShowPickedImage() {
    customizeDataModel.showPickedImage = !customizeDataModel.showPickedImage;
    notifyListeners();
  }

  Future<bool> backPressed(BuildContext context) async {
    customizeDataModel.image = null;
    customizeDataModel.showPickedImage = false;
    Navigator.pop(context);
    return true;
  }

  void moveToImageView(BuildContext context) {
    customizeDataModel.callApi = false;
    customizeDataModel.showLoaderForEdit = true;
    customizeDataModel.customize = false;
    NavUtils.navigateToImageView(context);
  }

  void closePressed(BuildContext context) {
    customizeDataModel.showPickedImage=false;
    changeCustomize();
    Navigator.pop(context);
  }
}
