import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class CartModel extends Equatable {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String imageUrl;

  CartModel({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });

  CartModel copyWith({
    String? id,
    String? title,
    int? quantity,
    double? price,
    String? imageUrl,
  }) {
    return CartModel(
      id: id ?? this.id,
      title: title ?? this.title,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object> get props => [id, title, quantity, price, imageUrl];

  static List<CartModel> sampleData = [
    CartModel(
      id: Uuid().v4(),
      title: 'Sample Product 1',
      quantity: 2,
      price: 29.99,
      imageUrl: 'https://source.unsplash.com/random/?product',
    ),
    CartModel(
      id: Uuid().v4(),
      title: 'Sample Product 2',
      quantity: 1,
      price: 59.99,
      imageUrl: 'https://source.unsplash.com/random/?product',
    ),
  ];

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'quantity': quantity,
      'price': price,
      'imageUrl': imageUrl,
    };
  }
}