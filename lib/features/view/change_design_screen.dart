import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_panning/features/view/image_view_and_crop_screen.dart';
import 'package:image_panning/features/view_model/upload_picture_view_model.dart';
import 'package:image_panning/features/widgets/image_select_pop%20_up.dart';
import 'package:image_panning/features/widgets/my_app_bar.dart';
import 'package:image_panning/utils/app_color.dart';
import 'package:image_panning/utils/app_images.dart';
import 'package:image_panning/utils/string_constants.dart';
import 'package:provider/provider.dart';

class ChangeDesignScreen extends StatelessWidget {
  const ChangeDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UploadPictureViewModel viewModel =
        Provider.of<UploadPictureViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: MyAppBar(
              title: changeDesign,
              onBackPressed: () => Navigator.pop(context))),
      body: Column(
        children: [
          Center(
            child: GestureDetector(
              onTap: () => openBottomSheet(context,viewModel),
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

  openBottomSheet(BuildContext context, UploadPictureViewModel viewModel) {
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
                    viewModel.getImageFromCamera(true).then((dynamic value) =>{
                      if(value!=null){
                        navigateToNextScreen(context)
                      }
                    } );
                  },
                  child: const ImageSelectPopUp(title: camera)),
              const SizedBox(
                width: 30.0,
              ),
              const ImageSelectPopUp(title: gallery),
            ],
          ),
        );
      },
    );
  }
}

navigateToNextScreen(BuildContext context) {
  dynamic route=MaterialPageRoute(builder: (context)=>const ImageViewAndCropScreen());
  Navigator.push(context, route);
}
