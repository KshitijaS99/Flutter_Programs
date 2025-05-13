import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<Map<String, String>> _items = [];
  double _total = 0.0;

  List<Map<String, String>> get items => _items;
  double get total => _total;

  void addToCart(Map<String, String> item) {
    _items.add(item);
    _calculateTotal();
    notifyListeners();
  }

  void removeFromCart(int index) {
    _items.removeAt(index);
    _calculateTotal();
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _total = 0.0;
    notifyListeners();
  }

  void _calculateTotal() {
    _total = _items.fold(0.0, (sum, item) {
      final price = double.parse(item['price']!.replaceAll('\$', ''));
      return sum + price;
    });
  }
}
