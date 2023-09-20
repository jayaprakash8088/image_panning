import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_panning/core/services/api_client.dart';
import 'package:image_panning/core/services/url.dart';

import '../../features/model/save_image_response_model.dart';

class Repository{
  final ApiClient apiClient=ApiClient();

  Future<dynamic>saveImage(File image)async{
    dynamic response;
    try{
       response=await apiClient.postAPI(postProfileBannerImage,image);
    }catch(e){debugPrint(e.toString());}
    if(response!=null) {
      return SaveImageResponseModel.fromJson(response);
    }else{
      return null;
    } }
}