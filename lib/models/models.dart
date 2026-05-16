import 'package:flutter/material.dart';

class FoodItem {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryId;

  FoodItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
  });
}

class Category {
  final String id;
  final String name;
  final String imageUrl;

  Category({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
}

class CartItem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });
}
