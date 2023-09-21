import 'package:flutter/material.dart';
import 'package:image_panning/features/view/edit_card_screen.dart';
import 'package:image_panning/features/widgets/button_ui.dart';
import 'package:image_panning/features/widgets/customize_btn.dart';
import 'package:image_panning/features/widgets/my_app_bar.dart';
import 'package:image_panning/features/widgets/top_button.dart';
import 'package:image_panning/utils/string_constants.dart';
import 'package:provider/provider.dart';

import '../../utils/app_config.dart';
import '../view_model/upload_picture_view_model.dart';
import '../widgets/profile.dart';

class LongImage extends StatelessWidget {
  const LongImage({super.key});

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey();
    UploadPictureViewModel viewModel =
        Provider.of<UploadPictureViewModel>(context);
    return Scaffold(
      appBar: MyAppBar(customImageCard, context),
      body: viewModel.showLoaderForLongUI?
          const Center(child: CircularProgressIndicator(),):
      SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              const SizedBox(height: 5.0),
               const TopButton(),
              const SizedBox(height: 10.0),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      RepaintBoundary(
                        key: globalKey,
                        child: InteractiveViewer(
                            scaleEnabled: viewModel.customize,
                            constrained: false,
                            minScale: 0.1,
                            scaleFactor: 0.5,
                            maxScale: 6,
                            panEnabled: viewModel.customize,
                            child: Image.network(
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                              viewModel
                                      .fetchImageResponseModel
                                      ?.result?[0]
                                      .customImageCardDesignInfo
                                      ?.profileBannerImageURL ??
                                  '',
                            )),
                      ),
                      Visibility(
                        visible: !viewModel.customize,
                        child: Positioned(
                            top: 10.0,
                            right: 10.0,
                            child: GestureDetector(
                              onTap: () {
                                viewModel.changeCustomize();
                              },
                              child: const CustomizeButton(),
                            )),
                      ),
                      const Positioned.fill(top: 30.0, child: Profile())
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              GestureDetector(onTap: () {
                viewModel.resizeImage(globalKey).then((dynamic value) =>{
                  if(value!=null&&value){
                    moveToImageView(context,viewModel)
                  }else{
                AppConfig.showToast(somethingWrong)
                }
                } );
              }, child: const ButtonUI(text: save))
            ],
          ),
        ),
      ),
    );
  }

 void moveToImageView(BuildContext context, UploadPictureViewModel viewModel) {
   viewModel.callApi=false;
   viewModel.showLoaderForEdit=true;
   viewModel.customize=false;
    dynamic newRoute=MaterialPageRoute(builder: (context)=>const EditCardScreen());
    Navigator.pushAndRemoveUntil(context, newRoute, (route) => false);
  }
}
