import 'package:flutter/material.dart';
import 'package:pet_presentation/resources/app_colors.dart';


class CircularLoading extends StatefulWidget {
  final double? size;
  const CircularLoading({
    super.key,
    this.size,
  });

  @override
  _CircularLoadingState createState() => _CircularLoadingState();
}

class _CircularLoadingState extends State<CircularLoading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.size,
        height: widget.size,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryBackgroundColor),
          strokeWidth: 6,
        ),
      ),
    );
  }
}
