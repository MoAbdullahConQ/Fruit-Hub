import 'package:ecommerce_app/core/utils/app_text_style.dart';
import 'package:ecommerce_app/core/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    leading: IconButton(
      onPressed: () {},
      icon: Icon(Icons.arrow_back_ios_new_rounded),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text('الأكثر مبيعًا', style: TextStyles.bold19),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: NotificationWidget(),
      ),
    ],
  );
}
