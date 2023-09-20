import 'package:flutter/material.dart';

class SmallIcon extends StatelessWidget {
  const SmallIcon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 35.0,width: 35.0,
      decoration: const BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child:  Icon(icon),
    );
  }
}
