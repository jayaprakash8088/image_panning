import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_panning/features/widgets/button_ui.dart';
import 'package:provider/provider.dart';

import '../../utils/string_constants.dart';
import '../view_model/upload_picture_view_model.dart';
import '../widgets/my_app_bar.dart';

class ImageViewAndCropScreen extends StatelessWidget {
  const ImageViewAndCropScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UploadPictureViewModel viewModel =
        Provider.of<UploadPictureViewModel>(context);
    viewModel.finalCroppedFile == null ? viewModel.cropImage() : null;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: MyAppBar(
              title: viewModel.finalCroppedFile != null
                  ? uploadPicture
                  : editPhoto,
              onBackPressed: () => Navigator.pop(context))),
      body: viewModel.showLoader?const Center(child: CircularProgressIndicator()):Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Image.file(File(viewModel.finalCroppedFile != null
                  ? viewModel.finalCroppedFile!.path
                  : viewModel.image!.path))),
          viewModel.finalCroppedFile != null
              ? const Text(
                  readyToSave,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
                )
              : const SizedBox(),
          viewModel.finalCroppedFile != null
              ? GestureDetector(
            onTap: ()=>viewModel.saveImage(),
                child: const ButtonUI(
                    text: saveContinue,
                  ),
              )
              : const SizedBox()
        ],
      ),
    );
  }
}
