

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';



FormFieldValidator passwordValidator() {
  return (password) {
    if(password.isEmpty){
      return 'This Field Should Not be empty';
    }
    if (password.length < 6) {
      return 'password should be at least be 6 characters';
    }
    return null;
    // Pattern pattern =
    //     r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
    // RegExp regex = new RegExp(pattern);
    // if (!regex.hasMatch(password))
    //   return 'Invalid password';
    // else
    //   return null;
  };
}

FormFieldValidator matchPasswordValidator(String text) {

  return (value) {
    if (value != text) {
      return 'Password is not matching';
    } else
      return null;
  };
}

FormFieldValidator emailValidator(String text) {
  return (value) {
    if (!EmailValidator.validate(text, true)) {
      return 'Please Provide a valid email address';
    } else if(text.isEmpty){
      return 'This Field Should Not be empty';
    }else
      return null;
  };
}

FormFieldValidator emptyFieldVAlidator(String text){
  return (value) {
     if(text.isEmpty){
      return 'This Field Should Not be empty';
    }else
      return null;
  };
}
