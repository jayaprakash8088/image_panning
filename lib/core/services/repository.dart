import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_panning/core/services/api_client.dart';
import 'package:image_panning/core/services/url.dart';
import 'package:image_panning/features/model/fetch_image_response_model.dart';

import '../../features/model/save_image_response_model.dart';

class Repository{
  final ApiClient apiClient=ApiClient();
// save image
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

  // fetch image

 Future<dynamic>fetchImage()async{
    dynamic response;
    Map data = {
      cardImageId: id
    };
    var body=jsonEncode(data);
    try{
      response=await apiClient.postAPIToFetchImage(selectedCardDesignDetails,body);
      if(response!=null){
        return FetchImageResponseModel.fromJson(jsonDecode(response));
      }else{
        return  FetchImageResponseModel();
      }
    }catch(e){
      debugPrint(e.toString());
    }
 }
}