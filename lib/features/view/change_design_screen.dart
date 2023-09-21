import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_panning/features/view_model/upload_picture_view_model.dart';
import 'package:image_panning/utils/app_color.dart';
import 'package:image_panning/utils/app_images.dart';
import 'package:image_panning/utils/string_constants.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_sheet.dart';

class ChangeDesignScreen extends StatelessWidget {
  const ChangeDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UploadPictureViewModel viewModel =
        Provider.of<UploadPictureViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          leadingWidth: 10.0,
          title:  Text(changeDesign,style:  GoogleFonts.roboto(
            color:black,fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),),
          centerTitle:false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20.0,),
          Center(
            child: GestureDetector(
              onTap: () => openBottomSheet(context,viewModel,false),
              child: Container(
                height: 65.0,
                padding: const EdgeInsets.all(5.0),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: const BoxDecoration(
                    color: lightBlue,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(bigMagicIcon)),
                    Text(
                      uploadPicture,
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          color: deepBlue,
                          fontSize: 16.0),
                    ),
                    Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(smallMagicIcon)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

}


