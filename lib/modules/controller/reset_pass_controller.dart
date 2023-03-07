import 'package:flutter/cupertino.dart';

class ResetPassController with ChangeNotifier{

  bool isPassVisible=false;
  bool isConfrimPassVisi=false;

//This func make textObscure true and false(hide and show password)
  showPass(){
    if(isPassVisible==true){
      isPassVisible=false;
      notifyListeners();
    }else{
      isPassVisible=true;
      notifyListeners();
    }

  }


}