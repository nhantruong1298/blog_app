import 'package:flutter/material.dart';
import 'package:pet_presentation/exception/app_exception.dart';
import 'package:pet_presentation/resources/app_colors.dart';
import 'package:pet_presentation/resources/app_dimensions.dart';
import 'package:pet_presentation/widgets/commons/typography/body_text.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
    this.exception,
    this.onRetry,
    this.title,
  }) : super(key: key);

  final AppException? exception;
  final VoidCallback? onRetry;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final errorMsg = exception?.displayMessage ??
       'Unexpected error';

    final titleMessage =
        title ?? 'Error';

    return Center(
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
             //   Assets.images.unexpectedError.image(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.defaultPadding,
                    vertical: AppDimensions.defaultPadding * 1.5,
                  ),
                  child: Column(
                    children: [
                      BodyXLText.bold(
                        titleMessage,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          top: AppDimensions.defaultPadding * 0.5,
                        ),
                        child: BodyMText(
                          errorMsg,
                          style: const TextStyle(color: AppColors.textColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: onRetry,
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
