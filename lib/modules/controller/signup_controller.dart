import 'package:flutter/cupertino.dart';

class SignupController with ChangeNotifier{

 bool isTnCSelected=false;


//occurs when user click terms and conditions checkbox
void changeCheckBoxVal(bool value){
  isTnCSelected=value;
  notifyListeners();

} 

}