import 'package:fluttertoast/fluttertoast.dart';

class AppConfig{
// toast msg
  static Future showToast(String text){
    return Fluttertoast.showToast(
        msg:text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0
    );
  }
  static List<String>imageTypes=['jpg,jpeg,png,svg'];
}