import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class EditCardButton extends StatelessWidget {
  const EditCardButton({super.key, required this.text});
 final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration:  BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
         border: Border.all(color: red,)),
      child:  Center(
        child: Text(text,
            style: const TextStyle(
                color: red, fontSize: 20.0, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
