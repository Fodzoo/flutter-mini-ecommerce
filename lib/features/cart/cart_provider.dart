import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier{
  List<Map<String,dynamic>> cart =[];

  void addToCart(
  {
    required String name,
    required double price,
    required String image,

})
  {
    int existingProductIndex = cart.indexWhere(
        (product)=> product["name"] == name,
    );

    if(existingProductIndex != -1){
      cart[existingProductIndex]["quantity"]++;
    }
    else {
      cart.add({
        "name":name,
        "price":price,
        "image":image,
        "quantity":1,
      });
    }

    notifyListeners();
  }
  void increaseQuantity(int index){
    cart[index]["quantity"]++;
    notifyListeners();
  }

  void decreaseQuantity(int index){
    if(cart[index]["quantity"] >1){
      cart[index]["quantity"]--;
      notifyListeners();
    }
  }

  void removeProduct(int index){
    cart.removeAt(index);
    notifyListeners();
  }

  void clearCart(){
    cart.clear();
    notifyListeners();
  }

  double getTotal(){
    double total = 0;

    for(var product in cart){
      total += product["price"] * product["quantity"];
    }
    return total;

  }



}