import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key, required this.title, required this.onBackPressed});
  final String title;
  final Function onBackPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      foregroundColor: white,
      leadingWidth: 5.0,
      leading: GestureDetector(
        onTap: ()=>onBackPressed,
        child: IconButton(onPressed:()=> onBackPressed, icon:const Icon(
          size:14.0,
          Icons.arrow_back_ios_sharp,
        color: black,) ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 5.0),
        child: Text(title,style: GoogleFonts.roboto(
          color:black,fontSize: 16.0,
          fontWeight: FontWeight.w500,
        )),
      ),
    );
  }
}
