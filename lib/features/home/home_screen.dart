import 'package:flutter/material.dart';
import 'package:task1/core/theme/app_color.dart';
import 'package:task1/core/widgets/custom_text.dart';
import 'package:task1/features/cart/cart_screen.dart';
import 'package:task1/features/home/widgets/product_card_item.dart';
import 'package:provider/provider.dart';
import '../cart/cart_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Map<String, dynamic>> cart = [];

  // void addToCart({
  //   required String name,
  //   required double price,
  //   required String image,
  // }) {
  //   setState(() {
  //     int existingProductIndex = cart.indexWhere(
  //       (product) => product['name'] == name,
  //     );
  //
  //     if (existingProductIndex != -1) {
  //       cart[existingProductIndex]['quantity']++;
  //     } else {
  //       cart.add({'name': name, 'price': price, 'image': image, 'quantity': 1});
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,

        title: const CustomText(
          text: 'Mini Shop',
          size: 22,
          weight: FontWeight.bold,
          color: Colors.white,
        ),

        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
              },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const CustomText(
              text: 'Products',
              size: 24,
              weight: FontWeight.bold,
              color: Colors.black,
            ),

            const SizedBox(height: 16),

            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),

                children: [
                  ProductCardItem(
                    name: 'Wireless Headphones',
                    price: 59.99,
                    image: 'assets/images/headphones.png',

                    onAddToCart: () {
                      context.read<CartProvider>().addToCart(
                        name: 'Wireless Headphones',
                        price: 59.99,
                        image: 'assets/images/headphones.png',
                      );
                    },
                  ),

                  ProductCardItem(
                    name: 'Smart Watch',
                    price: 79.99,
                    image: 'assets/images/smart_watch.png',

                    onAddToCart: () {
                      context.read<CartProvider>().addToCart(
                        name: 'Smart Watch',
                        price: 79.99,
                        image: 'assets/images/smart_watch.png',
                      );
                    },
                  ),

                  ProductCardItem(
                    name: 'Wireless Mouse',
                    price: 24.99,
                    image: 'assets/images/mouse.jpg',

                    onAddToCart: () {
                      context.read<CartProvider>().addToCart(
                        name: 'Wireless Mouse',
                        price: 24.99,
                        image: 'assets/images/mouse.jpg',
                      );
                    },
                  ),

                  ProductCardItem(
                    name: 'Mechanical Keyboard',
                    price: 89.99,
                    image: 'assets/images/keyboard.jpg',

                    onAddToCart: () {
                      context.read<CartProvider>().addToCart(
                        name: 'Mechanical Keyboard',
                        price: 89.99,
                        image: 'assets/images/keyboard.jpg',
                      );
                    },
                  ),

                  ProductCardItem(
                    name: 'Bluetooth Speaker',
                    price: 44.99,
                    image: 'assets/images/speaker.jpg',

                    onAddToCart: () {
                      context.read<CartProvider>().addToCart(
                        name: 'Bluetooth Speaker',
                        price: 44.99,
                        image: 'assets/images/speaker.jpg',
                      );
                    },
                  ),

                  ProductCardItem(
                    name: 'USB-C Hub',
                    price: 29.99,
                    image: 'assets/images/usb_hub.jpg',

                    onAddToCart: () {
                      context.read<CartProvider>().addToCart(
                        name: 'USB-C Hub',
                        price: 29.99,
                        image: 'assets/images/usb_hub.jpg',
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
