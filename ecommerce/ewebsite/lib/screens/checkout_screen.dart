import 'package:flutter/material.dart';
import 'package:ewebsite/models/product.dart'; // Import your Product model
import 'package:qr_flutter/qr_flutter.dart'; // Add this dependency to pubspec.yaml
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<CartItem> cartItems = [];

  @override
  void initState() {
    super.initState();
    _loadCartItems();
  }

  Future<void> _loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getStringList('cart');
    if (cartJson != null) {
      setState(() {
        cartItems = cartJson
            .map((item) => CartItem.fromJson(jsonDecode(item)))
            .toList();
      });
    }
  }

  double get total {
    return cartItems.fold(
        0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItems[index];
                  return ListTile(
                    title: Text(cartItem.product.name),
                    subtitle: Text(
                        'Quantity: ${cartItem.quantity} x \$${cartItem.product.price.toStringAsFixed(2)}'),
                    trailing: Text(
                        '\$${(cartItem.product.price * cartItem.quantity).toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: QrImageView(
                data: 'Payment amount: \$${total.toStringAsFixed(2)}',
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            const SizedBox(height: 10),
            const Center(child: Text('Scan to Pay')),
          ],
        ),
      ),
    );
  }
}
