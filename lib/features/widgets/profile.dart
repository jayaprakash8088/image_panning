import 'package:flutter/cupertino.dart';
import 'package:image_panning/utils/app_images.dart';

import '../../utils/app_color.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(editPicture),
        const SizedBox(height: 10.0,),
        const Text('ALEXANDRA',style: TextStyle(color: white,
            fontWeight: FontWeight.w600,fontSize: 18.0),),
        const Text('Stanton',style: TextStyle(color: white,
            fontWeight: FontWeight.w500,fontSize: 16.0),),
      ],
    );
  }
}
