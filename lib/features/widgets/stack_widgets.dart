import 'package:flutter/material.dart';
import 'package:image_panning/features/widgets/cards_ui.dart';
import 'package:image_panning/features/widgets/logo_ui.dart';
import 'package:image_panning/utils/app_color.dart';

import '../../utils/app_images.dart';

class StackWidgets extends StatelessWidget {
  const StackWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 30.0),
        ClipOval(
          child:CircleAvatar(radius: 48.0,
              backgroundImage: AssetImage(rail)),
        ),
        SizedBox(height: 10.0,),
        Text('ALEXANDRA',style: TextStyle(color: white,
        fontWeight: FontWeight.w600,fontSize: 18.0),),
        Text('Stanton',style: TextStyle(color: white,
            fontWeight: FontWeight.w500,fontSize: 16.0),),
        SizedBox(height: 10.0,),
        Text('Realtor | VP design ',style: TextStyle(color: white,
            fontWeight: FontWeight.w400,fontSize: 16.0),),
        Text('Bengaluru India',style: TextStyle(color: white,
            fontWeight: FontWeight.w400,fontSize: 16.0),),
        SizedBox(height: 120.0,),
        CardsUI(),
        LogoUI()
      ],
    );
  }
}
