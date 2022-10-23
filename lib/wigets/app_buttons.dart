import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal/wigets/app_text.dart';

// ignore: must_be_immutable
class AppBtn extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  String? textBtn;
  IconData? icon;
  bool? isICon;
  AppBtn(
      {Key? key,
      this.icon,
      this.textBtn,
      this.isICon = false,
      required this.color,
      required this.size,
      required this.backgroundColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(),
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isICon == false
          ? Center(
              child: AppText(
                text: textBtn!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
