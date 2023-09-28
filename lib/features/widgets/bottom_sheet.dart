import 'package:flutter/material.dart';
import 'package:image_panning/features/widgets/image_select_pop_up.dart';
import 'package:image_panning/utils/nav_utils.dart';

import '../../utils/string_constants.dart';
import '../view_model/edit_view_model.dart';
import '../view_model/upload_picture_view_model.dart';

Future openBottomSheet(BuildContext context, UploadPictureViewModel? viewModel,
    EditViewModel? editViewModel) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return  SizedBox(
        height: 142.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: (){
                 if(viewModel!=null){
                   viewModel.getImage(true).then((dynamic value) =>{
                     if(value!=null){
                       NavUtils.navigateToImageViewCropScreen(context)
                     }
                   } );
                 }else{
                   editViewModel!.getImage(true).then((dynamic value) =>{
                     if(value!=null){
                       Navigator.pop(context)
                     }
                   } );
                 }
                },
                child: const ImageSelectPopUp(title: camera)),
            const SizedBox(
              width: 30.0,
            ),
            GestureDetector(
                onTap: (){
                 if(viewModel!=null){
                   viewModel.getImage(false).then((dynamic value) =>{
                     if(value!=null){
                       NavUtils.navigateToImageViewCropScreen(context)
                     }
                   } );
                 }else{
                   editViewModel!.getImage(false).then((dynamic value) =>{
                     if(value!=null){
                       Navigator.pop(context)
                     }
                   } );
                 }
                },
                child: const ImageSelectPopUp(title: gallery)),
          ],
        ),
      );
    },
  );
}
