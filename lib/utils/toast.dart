
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import '../appcolors/app_color.dart';
import '../enums/toast_states.dart';


class ToastConfig{

  static showToast({
    required String msg,
    required ToastStates toastStates,
  }) =>
      Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToastColor(toastStates),
        textColor: Colors.white,
        fontSize: 16.0,
      );
}


Color chooseToastColor(ToastStates state) {
  late Color color;
  switch (state) {
    case ToastStates.Success:
      color = AppColors.greenColor;
      break;
    case ToastStates.Error:
      color = AppColors.redColor;
      break;
    case ToastStates.Warning:
      color = Colors.amber;
      break;
  }

  return color;
}