import 'package:flutter/cupertino.dart';

class ForgotPassController with ChangeNotifier{
  bool isSmsSelcted=true;
  bool isMailSelected=false;


//This func make textObscure true and false(hide and show password)
  void switchOption(){
    if(isSmsSelcted==true){
      isSmsSelcted=false;
      isMailSelected=true;
      notifyListeners();
    }else{
      isSmsSelcted=true;
      isMailSelected=false;
      notifyListeners();
    }


  }

}