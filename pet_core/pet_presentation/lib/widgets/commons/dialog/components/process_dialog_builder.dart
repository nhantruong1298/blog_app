import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/widgets/commons/loading_indicator/circular_loading.dart';
import '../app_dialog_manager.dart';

class ProcessingDialogBuilder extends AppDialogBuilder {
  final bool showLoading;

  ProcessingDialogBuilder({this.showLoading = false});

  @override
  Widget buildDialog(Key key) {
    return Container(
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: showLoading
                  ? Container(
                      color: AppColors.dialogBackDropColor,
                      child: Center(
                        child: SizedBox(
                          width: double.infinity,
                          // height: 4,
                          child: Platform.isAndroid
                              ? const CircularLoading(size: 80)
                              : const CupertinoActivityIndicator(radius: 15),
                          // color: Colors.black,
                        ),
                      ),
                    )
                  : Container()),
        ],
      ),
      color: Colors.transparent,
      height: double.infinity,
      width: double.infinity,
    );
  }
}
