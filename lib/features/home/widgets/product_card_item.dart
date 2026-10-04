import 'package:flutter/material.dart';
import 'package:task1/core/theme/app_color.dart';
import 'package:task1/core/widgets/custom_button.dart';
import 'package:task1/core/widgets/custom_text.dart';

class ProductCardItem extends StatelessWidget {
  final String name;
  final double price;
  final String image;
  final VoidCallback onAddToCart;

  const ProductCardItem({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 10),

          CustomText(
            text: name,
            size: 16,
            weight: FontWeight.bold,
            color: Colors.black,
          ),

          const SizedBox(height: 5),

          CustomText(
            text: '\$$price',
            size: 15,
            weight: FontWeight.w600,
            color: AppColors.primary,
          ),

          const SizedBox(height: 10),

          CustomButton(
            text: 'Add to Cart',
            onTap: onAddToCart,
            color: AppColors.primary,
            colorText: Colors.white,
          ),
        ],
      ),
    );
  }
}