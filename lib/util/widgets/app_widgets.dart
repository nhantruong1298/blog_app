import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppWidgets {
  static Widget appbar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.blue[50],
      leading: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Icon(
          Icons.navigate_before,
          size: 40,
          color: Color.fromRGBO(125, 170, 206, 1),
        ),
        onTap: () => Get.back(),
      ),
    );
  }
}
