import 'package:flutter/material.dart';

import '../features/view/customize/edit_card_screen.dart';
import '../features/view/customize/long_image.dart';
import '../features/view/image_upload_and_edit/image_view_and_crop_screen.dart';

class NavUtils{
  static void navigateToLongImage(BuildContext context) {
    dynamic route=MaterialPageRoute(builder: (context)=> const LongImage());
    Navigator.push(context, route);
  }
  // move to image view
static void navigateToImageView(BuildContext context){
  dynamic newRoute =
  MaterialPageRoute(builder: (context) => const EditCardScreen());
  Navigator.pushAndRemoveUntil(context, newRoute, (route) => false);
}
static void moveToEditCard(BuildContext context) {
  dynamic route =
  MaterialPageRoute(builder: (context) => const EditCardScreen());
  Navigator.push(context, route);
}
static void navigateToImageViewCropScreen(BuildContext context) {
  dynamic route=MaterialPageRoute(builder: (context)=>const ImageViewAndCropScreen());
  Navigator.push(context, route);
}
}