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

  static Text bold({required String text, Color? color, double? size}) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? CupertinoColors.white,
        fontWeight: FontWeight.bold,
        fontSize: size
      ),
    );
  }

  static Text medium({required String text, Color? color, double? size}) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? CupertinoColors.white,
        fontWeight: FontWeight.w500,
        fontSize: size
      ),
    );
  }
}