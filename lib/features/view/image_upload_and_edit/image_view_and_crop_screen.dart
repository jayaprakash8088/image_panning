
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_panning/features/widgets/button_ui.dart';
import 'package:image_panning/utils/app_config.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_color.dart';
import '../../../utils/nav_utils.dart';
import '../../../utils/string_constants.dart';
import '../../view_model/upload_picture_view_model.dart';

class ImageViewAndCropScreen extends StatelessWidget {
  const ImageViewAndCropScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UploadPictureViewModel viewModel =
        Provider.of<UploadPictureViewModel>(context);
    viewModel.finalCroppedFile == null ? viewModel.cropImage() : null;
    return  Scaffold(
            appBar: viewModel.showLoader
                ? null
                :AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.white,
              leadingWidth: 20.0,
              leading: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      size: 20.0,
                      Icons.arrow_back_ios_sharp,
                      color: black,
                    )),
              ),
              title: Text(
                viewModel.finalCroppedFile != null ? uploadPicture : editPhoto,
                style: GoogleFonts.roboto(
                  color: black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body:viewModel.showLoader
                ? const Center(child: CircularProgressIndicator())
                : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.65,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          child: Image.file(
                              File(viewModel.finalCroppedFile != null
                                  ? viewModel.finalCroppedFile!.path
                                  : viewModel.image!.path),
                              fit: BoxFit.fill),
                        ),
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                          readyToSave,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16.0),
                        ),
                      // : const SizedBox(),
                  const SizedBox(
                    height: 50.0,
                  ),
                  GestureDetector(
                          onTap: () => {
                            viewModel.saveImage().then((dynamic value) => {
                                  if (value != null && value)
                                    {NavUtils.moveToEditCard(context)}
                                  else
                                    {AppConfig.showToast(somethingWrong)}
                                })
                          },
                          child: const ButtonUI(
                            text: saveContinue,
                          ),
                        )
              ],
            ),
                );
  }


}
