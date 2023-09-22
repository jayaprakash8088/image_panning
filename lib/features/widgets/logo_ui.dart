import 'package:flutter/material.dart';

import '../../utils/app_images.dart';

class LogoUI extends StatelessWidget {
  const LogoUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0,right: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(elredLogo),
          Image.asset(profile),
        ],
      ),
    );
  }
}
