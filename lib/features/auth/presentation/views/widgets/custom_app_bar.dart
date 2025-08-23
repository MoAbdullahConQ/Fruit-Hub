import 'package:ecommerce_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_ios_new),
    ),

    centerTitle: true,
    title: Text(title, style: TextStyles.bold19),
  );
}
