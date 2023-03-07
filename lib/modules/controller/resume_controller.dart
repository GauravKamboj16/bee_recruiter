import 'package:flutter/cupertino.dart';

class ResumeController with ChangeNotifier{
  bool isCreating=true;
  bool isUploading=false;

  //Switches between if user want to create resume or upload a copy.
  void switchOption(){
    if(isCreating==true){
      isCreating=false;
      isUploading=true;
      notifyListeners();
    }else{
      isCreating=true;
      isUploading=false;
      notifyListeners();
    }


  }
}