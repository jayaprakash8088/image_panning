import 'package:flutter/material.dart';
import 'package:image_panning/features/view/image_view_and_crop_screen.dart';
import 'package:image_panning/features/widgets/image_select_pop%20_up.dart';

import '../../utils/string_constants.dart';
import '../view_model/edit_view_model.dart';
import '../view_model/upload_picture_view_model.dart';

Future openBottomSheet(BuildContext context, UploadPictureViewModel? viewModel,
    EditViewModel? editViewModel) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return  SizedBox(
        height: 150.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: (){
                 if(viewModel!=null){
                   viewModel.getImage(true).then((dynamic value) =>{
                     if(value!=null){
                       navigateToNextScreen(context)
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
                       navigateToNextScreen(context)
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
void navigateToNextScreen(BuildContext context) {
  dynamic route=MaterialPageRoute(builder: (context)=>const ImageViewAndCropScreen());
  Navigator.push(context, route);
}