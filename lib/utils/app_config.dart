import 'package:fluttertoast/fluttertoast.dart';

class AppConfig{

  Future showToast(String text){
    return Fluttertoast.showToast(
        msg:text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        fontSize: 16.0
    );
  }
}