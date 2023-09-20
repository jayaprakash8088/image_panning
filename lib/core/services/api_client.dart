import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_panning/core/services/url.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_panning/utils/string_constants.dart';

class ApiClient {

  Future<dynamic> postAPI(String url, File img) async {
    try {
      var url1 = baseUrl + url;
      var uri = Uri.parse(url1);
      var request = http.MultipartRequest("POST", uri);
      request.headers['Authorization'] = 'Bearer $token';
      request.files.add(http.MultipartFile.fromBytes(
        key,
        img.readAsBytesSync(),
        contentType:  MediaType('image', img.path.split('.').last),
        filename:img.path.split('/').last ,
      ));
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        var data = jsonDecode(responseString);
        return data;
      } else {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        var d = jsonDecode(responseString);
        debugPrint(d.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<dynamic> postAPIToFetchImage(String url, String body)async {
    try{
      var url1 = baseUrl + url;
      var uri = Uri.parse(url1);
      var response = await http.post(uri,
          headers: {contentType: applicationJson,
          'Authorization' :'Bearer $token'
          },
          body: body
      );
      debugPrint("${response.statusCode}");
      debugPrint(response.body);
     if(response.statusCode==200){
       return response.body;
     }else{
       return null;
     }
    }catch(e){
      debugPrint(e.toString());
    }
  }
}
