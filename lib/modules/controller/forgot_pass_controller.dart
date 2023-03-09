import 'package:flutter/cupertino.dart';

class ForgotPassController with ChangeNotifier {
  bool isSmsSelcted = true;
  bool isMailSelected = false;

//This func switch bw Otp via Sms or Mail
  
  void switchToSms() {
    isSmsSelcted = true;
    isMailSelected = false;
    notifyListeners();
  }

  void switchToMail() {
    isSmsSelcted = false;
    isMailSelected = true;
    notifyListeners();
  }
}
