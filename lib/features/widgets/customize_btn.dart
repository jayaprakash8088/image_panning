import 'package:flutter/material.dart';
import 'package:image_panning/utils/app_color.dart';

class CustomizeButton extends StatelessWidget {
  const CustomizeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 30.0,
    decoration: const BoxDecoration(color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(5.0))),
    child: const Padding(
      padding: EdgeInsets.all(5.0),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.edit,color: red,size: 14,),
            Text('Customize',style: TextStyle(color: red),)
          ],
        ),
      ),
    ),);
  }
}
