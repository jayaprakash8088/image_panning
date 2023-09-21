import 'package:flutter/material.dart';
import 'package:image_panning/features/widgets/button_ui.dart';
import 'package:image_panning/features/widgets/customize_btn.dart';
import 'package:image_panning/features/widgets/my_app_bar.dart';
import 'package:image_panning/features/widgets/top_button.dart';
import 'package:image_panning/features/widgets/zoomable_image.dart';
import 'package:image_panning/utils/string_constants.dart';
import 'package:provider/provider.dart';

import '../view_model/upload_picture_view_model.dart';
import '../widgets/profile.dart';

class LongImage extends StatelessWidget {
  const LongImage({super.key});

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey();
    UploadPictureViewModel viewModel =
        Provider.of<UploadPictureViewModel>(context);
    final scaleMatrix = Matrix4.identity()..scale(0.5);
    final viewTransformationController = TransformationController(scaleMatrix);
    return Scaffold(
      appBar: MyAppBar(customImageCard, context),
      body: SingleChildScrollView(
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
                            transformationController:
                                viewTransformationController,
                            constrained: false,
                            minScale: 0.1,
                            maxScale: 6,
                            panEnabled: viewModel.customize,
                            onInteractionEnd: (details) {
                              var value = details.pointerCount;
                              var value1 = details.velocity;
                              var value2 = details.scaleVelocity;

                              print('${value1.pixelsPerSecond}');
                            },
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
                viewModel.resizeImage(globalKey);
              }, child: const ButtonUI(text: save))
            ],
          ),
        ),
      ),
    );
  }
}
