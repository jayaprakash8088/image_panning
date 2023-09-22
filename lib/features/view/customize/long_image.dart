import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_panning/features/view/customize/edit_card_screen.dart';
import 'package:image_panning/features/widgets/bottom_sheet.dart';
import 'package:image_panning/features/widgets/button_ui.dart';
import 'package:image_panning/features/widgets/customize_btn.dart';
import 'package:image_panning/features/widgets/top_button.dart';
import 'package:image_panning/utils/string_constants.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_config.dart';
import '../../view_model/edit_view_model.dart';
import '../../widgets/profile.dart';

class LongImage extends StatelessWidget {
  const LongImage({super.key});

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey();
    EditViewModel viewModel =
        Provider.of<EditViewModel>(context);
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          leadingWidth: 20.0,
          leading: !viewModel.customize
              ? Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      size: 20.0,
                      Icons.arrow_back_ios_sharp,
                      color: black,
                    )),
              )
              : const SizedBox(),
          title: Text(
            customImageCard,
            style: GoogleFonts.roboto(
              color: black,
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          centerTitle: viewModel.customize,
          actions: [
            viewModel.customize
                ? GestureDetector(
                    onTap: () {
                      viewModel.showPickedImage=false;
                      viewModel.changeCustomize();
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close, color: black),
                  )
                : const SizedBox()
          ]),
      body: viewModel.showLoaderForLongUI
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : WillPopScope(
        onWillPop: ()=>backPressed(viewModel,context),
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(top:5,left:20.0,right: 20.0,bottom: 20.0),
                  child: Column(
                    children: [
                      // const SizedBox(height: 5.0),
                      Visibility(
                          visible: viewModel.customize,
                          child: GestureDetector(
                              onTap: () {
                                openBottomSheet(context, null,viewModel);
                              },
                              child: const TopButton())),
                      const SizedBox(height: 10.0),
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: SizedBox(
                          height: viewModel.customize
                              ? MediaQuery.of(context).size.height * 0.7
                              : MediaQuery.of(context).size.height,
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
                                    trackpadScrollCausesScale: true,
                                    panEnabled: viewModel.customize,
                                    child: viewModel.showPickedImage
                                        ? Image.file(viewModel.image!,
                                      fit: BoxFit.fill,
                                      height: viewModel.customize
                                          ? MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.7
                                          : MediaQuery.of(context)
                                          .size
                                          .height,
                                      width:MediaQuery.of(context)
                                          .size
                                          .width ,
                                    )
                                        : Image.network(
                                            fit: BoxFit.fill,
                                            height: viewModel.customize
                                                ? MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.7
                                                : MediaQuery.of(context)
                                                    .size
                                                    .height,
                                            width:MediaQuery.of(context)
                                                .size
                                                .width ,
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
                      GestureDetector(
                          onTap: () {
                            viewModel
                                .resizeImage(globalKey)
                                .then((dynamic value) => {
                                      if (value != null && value)
                                        {
                                          moveToImageView(context, viewModel)
                                        }
                                      else
                                        {AppConfig.showToast(somethingWrong)}
                                    });
                          },
                          child: const ButtonUI(text: save))
                    ],
                  ),
                ),
              ),
          ),
    );
  }

  void moveToImageView(BuildContext context, EditViewModel viewModel) {
    viewModel.callApi = false;
    viewModel.showLoaderForEdit = true;
    viewModel.customize = false;
    dynamic newRoute =
        MaterialPageRoute(builder: (context) => const EditCardScreen());
    Navigator.pushAndRemoveUntil(context, newRoute, (route) => false);
  }

  backPressed(EditViewModel viewModel,BuildContext context)async {
    viewModel.image=null;
    viewModel.showPickedImage=false;
    Navigator.pop(context);
  }
}
