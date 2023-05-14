import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pollingapp/Styles/Colors.dart';

void error(BuildContext? context, {required String message}){

  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text(message),
     backgroundColor: Colors.red,
  ));


}

void success(BuildContext? context, {required String message}){

  ScaffoldMessenger.of(context!).showSnackBar(SnackBar(content: Text(message),
    backgroundColor: AppColors.primaryColor,
  ));


}

