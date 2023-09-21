import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class TopButton extends StatelessWidget {
  const TopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      decoration:  BoxDecoration(color: boxBgColor,
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      border: Border.all(color: bgColor,width: 2.0)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.photo_size_select_actual_outlined,size: 20.0,
          color: bgColor,),
          SizedBox(width: 10.0,),
          Text('Change picture here and adjust',
          style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500 ),)
        ],
      ),
    );
  }
}
