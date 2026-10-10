import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task1/core/theme/app_color.dart';
import 'package:task1/core/widgets/custom_button.dart';
import 'package:task1/core/widgets/custom_text.dart';
import 'cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void checkout() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Order Confirmed'),
          content: const Text('Your order has been placed successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<CartProvider>().clearCart();
              },
              child: Text('OK', style: TextStyle(color: AppColors.primary)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        title: const CustomText(
          text: 'Cart',
          size: 22,
          weight: FontWeight.bold,
          color: Colors.white,
        ),
      ),

      body: cartProvider.cart.isEmpty
          ? const Center(
              child: CustomText(
                text: 'Your cart is empty',
                size: 18,
                weight: FontWeight.w500,
                color: Colors.grey,
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),

                    children: [
                      for (
                        int index = 0;
                        index < cartProvider.cart.length;
                        index++
                      )
                        Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
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

                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                ),

                                child: Image.asset(
                                  cartProvider.cart[index]['image'],
                                  fit: BoxFit.contain,
                                ),
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: cartProvider.cart[index]['name'],
                                      size: 16,
                                      weight: FontWeight.bold,
                                      color: Colors.black,
                                    ),

                                    const SizedBox(height: 6),

                                    CustomText(
                                      text:
                                          '\$${cartProvider.cart[index]['price']}',
                                      size: 15,
                                      weight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),

                                    const SizedBox(height: 10),

                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            cartProvider.decreaseQuantity(
                                              index,
                                            );
                                          },

                                          icon: const Icon(Icons.remove),
                                        ),

                                        CustomText(
                                          text:
                                              '${cartProvider.cart[index]['quantity']}',
                                          size: 16,
                                          weight: FontWeight.bold,
                                          color: Colors.black,
                                        ),

                                        IconButton(
                                          onPressed: () {
                                            cartProvider.increaseQuantity(
                                              index,
                                            );
                                          },

                                          icon: const Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              IconButton(
                                onPressed: () {
                                  cartProvider.removeProduct(index);
                                },

                                icon: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          const CustomText(
                            text: 'Total',
                            size: 20,
                            weight: FontWeight.bold,
                            color: Colors.black,
                          ),

                          CustomText(
                            text:
                                '\$${cartProvider.getTotal().toStringAsFixed(2)}',
                            size: 20,
                            weight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      CustomButton(
                        text: 'Checkout',
                        onTap: checkout,
                        color: AppColors.primary,
                        colorText: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
