import 'package:flutter/material.dart';
import 'package:image_panning/features/view/image_view_and_crop_screen.dart';
import 'package:image_panning/features/widgets/image_select_pop%20_up.dart';

import '../../utils/string_constants.dart';
import '../view_model/upload_picture_view_model.dart';

Future openBottomSheet(BuildContext context, UploadPictureViewModel viewModel,bool fromUpdate) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return  SizedBox(
        height: 120.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: (){
                  viewModel.getImage(true,fromUpdate).then((dynamic value) =>{
                    if(value!=null){
                      fromUpdate?
                      Navigator.pop(context):
                      navigateToNextScreen(context)
                    }
                  } );
                },
                child: const ImageSelectPopUp(title: camera)),
            const SizedBox(
              width: 30.0,
            ),
            GestureDetector(
                onTap: (){
                  viewModel.getImage(false,fromUpdate).then((dynamic value) =>{
                    if(value!=null){
                      fromUpdate?
                      Navigator.pop(context):
                      navigateToNextScreen(context)
                    }
                  } );
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