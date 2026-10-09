import 'package:flutter/cupertino.dart';

class AppTexts {

  static Text regular({required String text, Color? color, double? size}) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? CupertinoColors.white,
        fontSize: size
      ),
    );
  }

  static Text bold({required String text, Color? color, double? size, TextAlign? align, TextOverflow? overflow, int? maxLines}) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? CupertinoColors.white,
        fontWeight: FontWeight.bold,
        fontSize: size,
        overflow: overflow
      ),
      textAlign: align,
      maxLines: maxLines,
    );
  }

  static Text black({required String text, Color? color, double? size, TextAlign? align, double? height}) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? CupertinoColors.white,
        fontWeight: FontWeight.w900,
        fontSize: size,
        height: height
      ),
      textAlign: align,
    );
  }

  static Text medium({required String text, Color? color, double? size, TextOverflow? overflow, int? maxLines, TextAlign? align}) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? CupertinoColors.white,
        fontWeight: FontWeight.w500,
        fontSize: size
      ),
      textAlign: align,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}