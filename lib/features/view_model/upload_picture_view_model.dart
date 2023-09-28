
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_panning/core/services/repository.dart';
import 'package:image_panning/features/model/data_model/upload_data_model.dart';
import 'package:image_panning/utils/app_config.dart';
import 'package:image_panning/utils/string_constants.dart';
import 'package:image_picker/image_picker.dart';

import '../model/save_image_response_model.dart';

class UploadPictureViewModel extends ChangeNotifier{
  final Repository repository=Repository();
  final UploadEditDataModel uploadEditDataModel=UploadEditDataModel();
  File? get image=>uploadEditDataModel.image;
  ImagePicker get picker =>uploadEditDataModel.picker;
  String get imagePath=>uploadEditDataModel.imagePath;
  CroppedFile? get finalCroppedFile=>uploadEditDataModel.finalCroppedFile;
  bool showLoader=false;

  //Image Picker function to get image from camera and gallery
  Future getImage(bool fromCamera) async {
    XFile? pickedFile;
    if(fromCamera){
      pickedFile=await picker.pickImage(source: ImageSource.camera);
    }else{
      pickedFile=await picker.pickImage(source: ImageSource.gallery);
    }
      if (pickedFile != null) {
        uploadEditDataModel.image =File(pickedFile.path) ;
      }
      return image;

  }

  Future cropImage() async {
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
        uploadEditDataModel.finalCroppedFile = croppedFile;
        notifyListeners();
      }
    }
    ////////////////api call//////////////////////////

  Future saveImage()async{
    SaveImageResponseModel? response;
    try{
      File? imageToSave;
      if(finalCroppedFile!=null){
        imageToSave=File(finalCroppedFile!.path);
      }else{
        imageToSave=File(image!.path);
      }
      final bytes = imageToSave.readAsBytesSync().lengthInBytes;
      final kb = bytes / 1024;
      final mb = kb / 1024;
      var type = imageToSave.path.split('.').last;
    if(mb<10){
    if(AppConfig.imageTypes.contains(type)){
      changeLoader();
      response=await repository.saveImage(imageToSave);
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

  /////////////////////////////////////////////////
  void changeLoader(){
    showLoader=!showLoader;
    notifyListeners();
  }



}