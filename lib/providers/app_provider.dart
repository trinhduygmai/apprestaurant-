import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class AppProvider with ChangeNotifier {
  String? _token;
  Map<String, CartItem> _cartItems = {};
  List<Category> _categories = [
    Category(id: '1', name: 'Chinese', imageUrl: 'https://cdn-icons-png.flaticon.com/512/2276/2276931.png'),
    Category(id: '2', name: 'South Indian', imageUrl: 'https://cdn-icons-png.flaticon.com/512/1046/1046788.png'),
    Category(id: '3', name: 'Beverages', imageUrl: 'https://cdn-icons-png.flaticon.com/512/2405/2405479.png'),
    Category(id: '4', name: 'North India', imageUrl: 'https://cdn-icons-png.flaticon.com/512/1046/1046777.png'),
  ];
  
  List<FoodItem> _foodItems = [
    FoodItem(
      id: 'f1',
      name: 'Fajita Chicken Burrito',
      description: 'Block 12',
      price: 825.0,
      imageUrl: 'placeholder',
      categoryId: '1',
    ),
    FoodItem(
      id: 'f2',
      name: 'Gulab Jamun',
      description: 'Block 12',
      price: 126.0,
      imageUrl: 'placeholder',
      categoryId: '4',
    ),
    FoodItem(
      id: 'f3',
      name: 'Noodles',
      description: 'chinese',
      price: 100.0,
      imageUrl: 'placeholder',
      categoryId: '1',
    ),
  ];

  String? get token => _token;
  List<Category> get categories => _categories;
  List<FoodItem> get foodItems => _foodItems;
  Map<String, CartItem> get cartItems => _cartItems;

  double get totalAmount {
    var total = 0.0;
    _cartItems.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  // Cart logic
  void addItem(String foodId, String name, double price) {
    if (_cartItems.containsKey(foodId)) {
      _cartItems.update(
        foodId,
        (existing) => CartItem(
          id: existing.id,
          name: existing.name,
          price: existing.price,
          quantity: existing.quantity + 1,
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        foodId,
        () => CartItem(
          id: foodId,
          name: name,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeOneItem(String foodId) {
    if (!_cartItems.containsKey(foodId)) return;
    if (_cartItems[foodId]!.quantity > 1) {
      _cartItems.update(
        foodId,
        (existing) => CartItem(
          id: existing.id,
          name: existing.name,
          price: existing.price,
          quantity: existing.quantity - 1,
        ),
      );
    } else {
      _cartItems.remove(foodId);
    }
    notifyListeners();
  }

  void clearCart() {
    _cartItems = {};
    notifyListeners();
  }

  // API Integration (Placeholder)
  Future<void> login(String email, String password) async {
    // Integration logic here with http
    _token = "dummy_token";
    notifyListeners();
  }
}
