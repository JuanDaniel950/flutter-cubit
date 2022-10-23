import 'package:flutter/material.dart';
import 'package:personal/misc/colors.dart';
import 'package:personal/wigets/app_text.dart';

// ignore: must_be_immutable
class ResponsiveBtn extends StatelessWidget {
  bool? isResponsive;
  double? width;
  String? textBtn;

  ResponsiveBtn(
      {Key? key, this.textBtn = '', this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isResponsive == true ? double.maxFinite : width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      child: Row(
        mainAxisAlignment: isResponsive == true
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          isResponsive == true
              ? Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: AppText(text: "Book Trip Now", color: Colors.white),
                )
              : Container(),
          Image.asset('img/button-one.png'),
        ],
      ),
    );
  }
}
