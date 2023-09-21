
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_panning/core/services/repository.dart';
import 'package:image_panning/features/model/fetch_image_response_model.dart';
import 'package:image_panning/utils/app_config.dart';
import 'package:image_panning/utils/string_constants.dart';
import 'package:image_picker/image_picker.dart';

import '../model/save_image_response_model.dart';

class UploadPictureViewModel extends ChangeNotifier{
  final Repository repository=Repository();
  File? image;
  final picker = ImagePicker();
  String imagePath='';
  CroppedFile? finalCroppedFile;
  bool showLoader=false;
  bool showLoaderForEdit=false;
  bool showLoaderForLongUI=false;
  bool showPickedImage=false;
  bool customize=false;
  final scaleMatrix = Matrix4.identity()..scale(1.0);
  final  viewTransformationController = TransformationController();
  //Image Picker function to get image from camera and gallery
  Future getImage(bool fromCamera, bool fromUpdate) async {
    XFile? pickedFile;
    if(fromCamera){
      pickedFile=await picker.pickImage(source: ImageSource.camera);
    }else{
      pickedFile=await picker.pickImage(source: ImageSource.gallery);
    }
      if (pickedFile != null) {
        image =File(pickedFile.path) ;
      }
      if(fromUpdate){
        changeShowPickedImage();
      }
      return image;

  }

  cropImage() async {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: image!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false
          ),
        ],
      );
      if (croppedFile != null) {
        finalCroppedFile = croppedFile;
        notifyListeners();
      }
    }
    ////////////////api call//////////////////////////

  Future saveImage()async{
    SaveImageResponseModel? response;
    try{
      File image=File(finalCroppedFile!.path);
      final bytes = image.readAsBytesSync().lengthInBytes;
      final kb = bytes / 1024;
      final mb = kb / 1024;
      var type = image.path.split('.').last;
    if(mb<10){
    if(AppConfig.imageTypes.contains(type)){
      changeLoader();
      response=await repository.saveImage(image);
    }else{
      AppConfig.showToast(wrongType);
    }
    }else{
     AppConfig.showToast(maxSize);
    }
      if(response!=null&&response.success!){
        changeLoader();
        return true;
      }else{
        changeLoader();
        return false;}
    }catch(e){debugPrint(e.toString());}
  }
  FetchImageResponseModel? fetchImageResponseModel;
  bool callApi=false;
  Future fetchImage()async{
    try{
      fetchImageResponseModel=await repository.fetchImage();
      if(fetchImageResponseModel!=null){
        changeEditLoader();
        return true;
      }else {
        return false;
      }
    }catch(e){debugPrint(e.toString());}
  }
  Future saveImageAfterCustomized(Uint8List imageBytes)async{
    SaveImageResponseModel? response;
    try{
      response=await repository.saveCustomImage(imageBytes);
      if(response!=null&&response.success!){
        changeLoaderForLong();
        return true;
      }else{changeLoaderForLong();
      return false;}
    }catch(e){
      debugPrint(e.toString());
    }
  }
  /////////////////////////////////////////////////
  void changeLoader(){
    showLoader=!showLoader;
    notifyListeners();
  }
  void changeEditLoader(){
    showLoaderForEdit=!showLoaderForEdit;
    callApi=true;
    notifyListeners();
  }
  void changeLoaderForLong(){
    showLoaderForLongUI=!showLoaderForLongUI;
    notifyListeners();
  }
  void changeCustomize(){
    customize=!customize;
    notifyListeners();
  }
  void changeShowPickedImage(){
    showPickedImage=!showPickedImage;
    notifyListeners();
  }
  Future resizeImage(GlobalKey<State<StatefulWidget>> globalKey)async{
     changeLoaderForLong();
    final boundary = globalKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    final image = await boundary?.toImage();
    final byteData = await image?.toByteData(format: ImageByteFormat.png);
    final imageBytes = byteData?.buffer.asUint8List();
    bool res=await saveImageAfterCustomized(imageBytes!);
    return res;
  }

}