
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_panning/features/view/long_image.dart';
import 'package:image_panning/features/widgets/edit_card_btn.dart';
import 'package:image_panning/features/widgets/stack_widgets.dart';
import 'package:image_panning/utils/string_constants.dart';
import 'package:provider/provider.dart';

import '../../utils/app_color.dart';
import '../view_model/edit_view_model.dart';

class EditCardScreen extends StatelessWidget {
  const EditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EditViewModel viewModel =
        Provider.of<EditViewModel>(context);
    if (!viewModel.callApi) {
      viewModel.fetchImage();
    }
    return  Scaffold(
      appBar:!viewModel.showLoaderForEdit?null:
      AppBar(elevation: 0.0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          leadingWidth: 20.0,
          leading:Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  size: 20.0,
                  Icons.arrow_back_ios_sharp,
                  color: black,) ),
          ),
          title:  Text(artist,style:  GoogleFonts.roboto(
            color:black,fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),),
          ),
      body:!viewModel.showLoaderForEdit
          ? const Center(child: CircularProgressIndicator())
          :SingleChildScrollView(
        physics: const ScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                   child: SizedBox(
                     width: MediaQuery.of(context).size.width*0.87,
                     height: MediaQuery.of(context).size.height*0.85,
                     child: Image.network(
                       loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent? loadingProgress) {
                         if (loadingProgress == null) return child;
                         return Center(
                           child: CircularProgressIndicator(
                             value: loadingProgress.expectedTotalBytes != null ?
                             loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                 : null,
                           ),
                         );
                       },
                       viewModel.fetchImageResponseModel?.result?[0]
                                  .customImageCardDesignInfo?.profileBannerImageURL ??
                              '',fit: BoxFit.cover,),
                   ),
                 ),

             const Align(
               child: StackWidgets())
        ],
      ),
                const SizedBox(height: 30.0,),
                GestureDetector(
                    onTap: (){
                      navigateToNextScreen(context);
                    },
                    child: const EditCardButton(text: editPhoto)),
                const SizedBox(height: 15.0,),
              ],
            ),
          ),
    );
  }

  void navigateToNextScreen(BuildContext context) {
    dynamic route=MaterialPageRoute(builder: (context)=> const LongImage());
    Navigator.push(context, route);
  }
}
