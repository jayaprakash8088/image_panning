import 'package:flutter/material.dart';
import 'package:image_panning/features/widgets/edit_card_btn.dart';
import 'package:image_panning/features/widgets/my_app_bar.dart';
import 'package:image_panning/utils/app_images.dart';
import 'package:image_panning/utils/string_constants.dart';
import 'package:provider/provider.dart';

import '../view_model/upload_picture_view_model.dart';

class EditCardScreen extends StatelessWidget {
  const EditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UploadPictureViewModel viewModel =
    Provider.of<UploadPictureViewModel>(context);
    viewModel.fetchImage();
    return  Scaffold(
      appBar:PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: MyAppBar(
              title:artist,
              onBackPressed: () => Navigator.pop(context))),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(rail),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Column(
                children: [

                ],
              ),
            ),
          ),
          const EditCardButton(text: editPhoto)
        ],
      ),
    );
  }
}
