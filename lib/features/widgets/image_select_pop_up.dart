import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_images.dart';
import '../../utils/string_constants.dart';

class ImageSelectPopUp extends StatelessWidget {
  const ImageSelectPopUp({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(title == camera ? cameraIcon : galleryIcon),
        Text(title,
            style: const TextStyle(
                color: black, fontSize: 14.0, fontWeight: FontWeight.w400)),
      ],
    );
  }
}
