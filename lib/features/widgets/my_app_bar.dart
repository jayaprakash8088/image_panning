import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';


class MyAppBar extends AppBar{
  MyAppBar(String title,BuildContext context, {super.key}):super(
    elevation: 0.0,
    backgroundColor: Colors.white,
    foregroundColor: Colors.white,
    leadingWidth: 5.0,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Icon(
        size:14.0,
        Icons.arrow_back_ios_sharp,
        color: black,) ),
    title:  Text(title,style:  GoogleFonts.roboto(
      color:black,fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),),
    centerTitle: true,
  );

}
