import 'package:bee_recruiter/constant/app_strings.dart';

class InputValidator {


  //This method has Empty field validation
  dynamic emptyString(value, msg) {
    if (value.isEmpty) {
      return "*$msg required";
    } else {
      return null;
    }
  }

  //This method has Email validation
  dynamic emailValidate(value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    if (value.isEmpty) {
      return "*email required";
    } else if (!regex.hasMatch(value)) {
      return "*Invalid email";
    } else {
      return null;
    }
  }

  //Validation for mobile number
  dynamic validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return '*Mobile number required!';
    } else if (!regExp.hasMatch(value)) {
      return '*Please enter valid mobile number!';
    }
    return null;
  }

  //Validation for Password Must include 1 capital alphabet,symbols and numbers
  dynamic validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid password';
      } else {
        return null;
      }
    }
  }

//Validation for confirm Password Must include 1 capital alphabet,symbols and numbers and should be same as new password
  dynamic validateConfirmPassword(String value, pass) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return 'Please enter password';
    } else if (!regex.hasMatch(value)) {
      return 'Enter valid password';
    } else if (value != pass) {
      return AppStrings.passDeosNotMatch;
    } else {
      return null;
    }
  }
}
