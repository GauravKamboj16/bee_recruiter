import 'package:flutter/cupertino.dart';

class SignInController with ChangeNotifier{
  bool isPassVisible=false;
  

//This func make textObscure true and false(hide and show password)
    void showPass(){
    if(isPassVisible==true){
      isPassVisible=false;
      print(isPassVisible);
      notifyListeners();
    }else{
      isPassVisible=true;
      print(isPassVisible);
      notifyListeners();
    }
  }


 

}