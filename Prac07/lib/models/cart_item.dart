class CartItem {
  final String name;
  final String restaurant;
  final double price;
  final String imageUrl;
  int quantity;

  CartItem({
    required this.name,
    required this.restaurant,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
  });

  double get totalPrice => price * quantity;
}
