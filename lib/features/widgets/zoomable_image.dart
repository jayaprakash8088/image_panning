import 'package:flutter/material.dart';

class ZoomableImage extends StatelessWidget {
  const ZoomableImage({super.key, required this.url});
   final String url;
  @override
  Widget build(BuildContext context) {

    return  InteractiveViewer(
        constrained: false,
        scaleEnabled: false,
        minScale: 0.5,
        maxScale: 4,
        panEnabled: true,
        child:  Image.network(
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
          url,));
  }
}
