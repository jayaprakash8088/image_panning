import 'package:flutter/material.dart';
import 'package:image_panning/features/widgets/edit_card_btn.dart';
import 'package:image_panning/features/widgets/my_app_bar.dart';
import 'package:image_panning/utils/string_constants.dart';
import 'package:provider/provider.dart';

import '../view_model/upload_picture_view_model.dart';

class EditCardScreen extends StatelessWidget {
  const EditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UploadPictureViewModel viewModel =
        Provider.of<UploadPictureViewModel>(context);
    if (!viewModel.callApi) {
      viewModel.fetchImage();
    }
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: MyAppBar(
              title: artist, onBackPressed: () => Navigator.pop(context))),
      body: !viewModel.showLoaderForEdit
          ? const Center(child: CircularProgressIndicator())
          : Stack(
        children: [
           Image.network(viewModel.fetchImageResponseModel?.result?[0]
                        .customImageCardDesignInfo?.profileBannerImageURL ??
                    ''),
          const Positioned(
              bottom: 10.0,
              child: EditCardButton(text: editPhoto))
        ],
      ),
    );
  }
}
