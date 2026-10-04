import 'package:flutter/material.dart';
import 'package:task1/core/widgets/custom_text.dart';
import '../theme/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.width,
    this.color,
    this.height, this.colorText,
  });

  final String text;
  final Function()? onTap;
  final double? width;
  final double? height;
  final Color? color;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height ?? 55,
        decoration: BoxDecoration(
          color: color ?? AppColors.primary,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: CustomText(
            text: text,
            color: colorText ?? Colors.white,
            weight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
