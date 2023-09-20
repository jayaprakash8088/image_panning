import 'package:flutter/material.dart';
import 'package:image_panning/features/widgets/samll_icon.dart';

class  CardsUI extends StatelessWidget {
  const  CardsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SizedBox(
      height: 50.0,
      child: Wrap(
        spacing: 5.0,
        children: [
         SmallIcon(icon: Icons.adb_sharp),
         SmallIcon(icon: Icons.mail),
         SmallIcon(icon: Icons.call),
         SmallIcon(icon: Icons.location_on),
         SmallIcon(icon: Icons.link),
        ],
      ),
    );
  }
}
