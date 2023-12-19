import 'dart:ui';
import 'package:flutter/cupertino.dart';
import '../main.dart';

class CustomTextWidget {
  boldText(
      {dynamic text = '',
      double? size,
      Color? color,
      TextStyle? style,
      TextAlign? alignment,
      double? fontSize,
      TextDecoration? textDecoration}) {
    return Text(text is Map ? text[LANGUAGE_TYPE]??'' : text??'',
        style: TextStyle(color: color, fontSize: fontSize));
  }

  regularText(
      {dynamic text = "",
      double? size,
      Color? color,
      TextStyle? style,
      TextAlign? alignment,
      double? fontSize,
      TextDecoration? textDecoration}) {
    return Text(
      text is Map ? text[LANGUAGE_TYPE] : text,
      style: TextStyle(color: color, fontSize: fontSize),
    );
  }

  semiBoldText(
      {dynamic text = "",
      double? size,
      Color? color,
      TextStyle? style,
      TextAlign? alignment,
      double? fontSize,
      TextOverflow? textOverflow,
      TextDecoration? textDecoration}) {
    return Text(
      text is Map ? text[LANGUAGE_TYPE] : text,
      style: TextStyle(color: color, fontSize: fontSize),
    );
  }
}
