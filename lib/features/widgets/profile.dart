import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
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
         Text('ALEXANDRA',style: GoogleFonts.raleway(color: white,
            fontWeight: FontWeight.w600,fontSize: 18.0),),
         Text('Stanton',style: GoogleFonts.raleway(color: white,
            fontWeight: FontWeight.w500,fontSize: 16.0),),
      ],
    );
  }
}
