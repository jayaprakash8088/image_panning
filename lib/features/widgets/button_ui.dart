import 'package:flutter/cupertino.dart';
import 'package:image_panning/utils/app_color.dart';

class ButtonUI extends StatelessWidget {
  const ButtonUI({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: const BoxDecoration(
          color: red, borderRadius: BorderRadius.all(Radius.circular(25.0))),
      child:  Center(
        child: Text(text,
            style: const TextStyle(
                color: white, fontSize: 20.0, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
