import 'package:flutter/material.dart';
import 'package:image_panning/features/view_model/upload_picture_view_model.dart';
import 'package:image_panning/utils/string_constants.dart';
import 'package:provider/provider.dart';

import 'features/view/image_upload_and_edit/change_design_screen.dart';
import 'features/view_model/edit_view_model.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>UploadPictureViewModel()),
    ChangeNotifierProvider(create: (_)=>EditViewModel())
  ],child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChangeDesignScreen(),
    );
  }
}
