import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore Foods',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          _buildFoodGrid(context),
        ],
      ),
    );
  }

  Widget _buildFoodGrid(BuildContext context) {
    final foods = [
      {
        'name': 'Classic Margherita Pizza',
        'description': 'A timeless favorite with hand-tossed dough, rich tomato sauce, fresh mozzarella, and basil leaves. Perfect for a cozy night in or sharing with friends. Baked to golden perfection.',
        'price': '\$12.99',
        'rating': '4.8',
        'restaurant': 'Pizza Palace',
        'imageUrl': 'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3',
        'category': 'Italian',
      },
      {
        'name': 'Spicy Buffalo Wings',
        'description': 'Crispy wings tossed in a fiery buffalo sauce, served with a side of cooling ranch dip. Ideal for game nights or a bold appetizer to kick off your meal.',
        'price': '\$8.99',
        'rating': '4.7',
        'restaurant': 'Wing House',
        'imageUrl': 'https://images.unsplash.com/photo-1608039829572-78524f79c4c7',
        'category': 'American',
      },
      {
        'name': 'Fresh Caesar Salad',
        'description': 'Fresh romaine lettuce, crunchy croutons, and shaved parmesan, tossed in a creamy Caesar dressing. A light and refreshing starter for any meal.',
        'price': '\$6.99',
        'rating': '4.5',
        'restaurant': 'Green Garden',
        'imageUrl': 'https://images.unsplash.com/photo-1550304943-4f24f54ddde9',
        'category': 'Salads',
      },
      {
        'name': 'Classic Cheeseburger',
        'description': 'Juicy Angus beef patty with cheddar cheese, lettuce, tomato, and our signature sauce, served with golden fries. A hearty classic that hits all the right spots.',
        'price': '\$10.99',
        'rating': '4.9',
        'restaurant': 'Burger King',
        'imageUrl': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
        'category': 'American',
      },
      {
        'name': 'Tofu Pad Thai',
        'description': 'Stir-fried rice noodles with tofu, bean sprouts, peanuts, and a tangy tamarind sauce. A vibrant, flavorful dish for plant-based food lovers.',
        'price': '\$9.99',
        'rating': '4.6',
        'restaurant': 'Asian Fusion',
        'imageUrl': 'https://images.unsplash.com/photo-1585032226651-759b368d7246',
        'category': 'Asian',
      },
      {
        'name': 'Grilled Salmon',
        'description': 'Tender salmon fillet grilled to perfection, served with lemon herb sauce and roasted vegetables. A healthy and delicious choice for seafood enthusiasts.',
        'price': '\$14.99',
        'rating': '4.8',
        'restaurant': 'Ocean Delights',
        'imageUrl': 'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
        'category': 'Seafood',
      },
      {
        'name': 'Creamy Mushroom Risotto',
        'description': 'Creamy Arborio rice cooked with wild mushrooms, parmesan, and a touch of white wine. A comforting dish that\'s rich and satisfying.',
        'price': '\$11.99',
        'rating': '4.7',
        'restaurant': 'Italian Delight',
        'imageUrl': 'https://images.unsplash.com/photo-1476124369491-e7addf5db371',
        'category': 'Italian',
      },
      {
        'name': 'BBQ Ribs Platter',
        'description': 'Slow-cooked pork ribs slathered in smoky BBQ sauce, served with coleslaw and fries. Fall-off-the-bone goodness for meat lovers.',
        'price': '\$15.99',
        'rating': '4.9',
        'restaurant': 'Smoke House',
        'imageUrl': 'https://images.unsplash.com/photo-1544025162-d76694265947',
        'category': 'BBQ',
      },
      {
        'name': 'Warm Chocolate Cake',
        'description': 'Warm, gooey chocolate cake with a molten center, paired with a scoop of vanilla ice cream. The ultimate dessert for chocolate lovers.',
        'price': '\$7.99',
        'rating': '4.8',
        'restaurant': 'Sweet Treats',
        'imageUrl': 'https://images.unsplash.com/photo-1578985545062-69928b1d9587',
        'category': 'Desserts',
      },
      {
        'name': 'Tropical Mango Smoothie',
        'description': 'A refreshing blend of ripe mangoes, yogurt, and a hint of honey. Perfect for a tropical escape any time of day.',
        'price': '\$4.99',
        'rating': '4.5',
        'restaurant': 'Juice Bar',
        'imageUrl': 'https://images.unsplash.com/photo-1621263764928-df1444c5e859',
        'category': 'Drinks',
      },
      {
        'name': 'Butter Chicken',
        'description': 'Tender chicken pieces simmered in a creamy tomato curry sauce, served with basmati rice. A flavorful Indian classic that warms the soul.',
        'price': '\$13.99',
        'rating': '4.7',
        'restaurant': 'Spice Garden',
        'imageUrl': 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398',
        'category': 'Indian',
      },
      {
        'name': 'Mediterranean Flatbread',
        'description': 'Crispy flatbread topped with cherry tomatoes, fresh mozzarella, basil, and a balsamic glaze drizzle. A light and flavorful appetizer or meal.',
        'price': '\$8.99',
        'rating': '4.6',
        'restaurant': 'Italian Delight',
        'imageUrl': 'https://images.unsplash.com/photo-1574071318508-1cdbab80d002',
        'category': 'Italian',
      },
      {
        'name': 'Spicy Shrimp Tacos',
        'description': 'Soft tortillas filled with spicy grilled shrimp, avocado, cilantro, and lime crema. A fresh and zesty option for taco lovers.',
        'price': '\$10.99',
        'rating': '4.7',
        'restaurant': 'Taco Fiesta',
        'imageUrl': 'https://images.unsplash.com/photo-1552332386-f8dd00dc2f85',
        'category': 'Mexican',
      },
      {
        'name': 'Classic Tiramisu',
        'description': 'Layers of coffee-soaked ladyfingers, mascarpone cream, and cocoa powder. A classic Italian dessert that\'s both rich and light.',
        'price': '\$6.99',
        'rating': '4.8',
        'restaurant': 'Sweet Treats',
        'imageUrl': 'https://images.unsplash.com/photo-1571877227208-0c5b47e607e9',
        'category': 'Desserts',
      },
      {
        'name': 'Green Matcha Latte',
        'description': 'Smooth, earthy matcha blended with milk and served over ice. A refreshing and energizing drink for any time of day.',
        'price': '\$5.99',
        'rating': '4.6',
        'restaurant': 'Juice Bar',
        'imageUrl': 'https://images.unsplash.com/photo-1631214524020-3c8167dae7c3',
        'category': 'Drinks',
      },
      {
        'name': 'Chicken Biryani',
        'description': 'Fragrant basmati rice cooked with tender chicken, aromatic spices, and herbs. A flavorful Indian rice dish that\'s both satisfying and delicious.',
        'price': '\$11.99',
        'rating': '4.7',
        'restaurant': 'Spice Garden',
        'imageUrl': 'https://images.unsplash.com/photo-1563379091339-03b21ab4a4f8',
        'category': 'Indian',
      },
      {
        'name': 'Sushi Platter',
        'description': 'Fresh assortment of nigiri and maki rolls, featuring premium fish and vegetables. A perfect choice for sushi enthusiasts.',
        'price': '\$16.99',
        'rating': '4.8',
        'restaurant': 'Ocean Delights',
        'imageUrl': 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c',
        'category': 'Japanese',
      },
      {
        'name': 'Greek Salad',
        'description': 'Crisp lettuce, juicy tomatoes, cucumber, olives, and feta cheese, dressed with olive oil and herbs. A refreshing Mediterranean classic.',
        'price': '\$7.99',
        'rating': '4.5',
        'restaurant': 'Green Garden',
        'imageUrl': 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c',
        'category': 'Salads',
      },
      {
        'name': 'Chicken Shawarma',
        'description': 'Marinated chicken wrapped in warm pita bread with fresh vegetables and garlic sauce. A Middle Eastern street food favorite.',
        'price': '\$8.99',
        'rating': '4.6',
        'restaurant': 'Mediterranean Delight',
        'imageUrl': 'https://images.unsplash.com/photo-1603360946369-dc9bb6258143',
        'category': 'Middle Eastern',
      },
      {
        'name': 'Veggie Burger',
        'description': 'Plant-based patty with lettuce, tomato, and special sauce on a toasted bun. A delicious meat-free alternative.',
        'price': '\$9.99',
        'rating': '4.4',
        'restaurant': 'Green Garden',
        'imageUrl': 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
        'category': 'Vegetarian',
      },
      {
        'name': 'Chocolate Croissant',
        'description': 'Buttery, flaky croissant filled with rich chocolate. A perfect breakfast or dessert treat.',
        'price': '\$3.99',
        'rating': '4.7',
        'restaurant': 'Sweet Treats',
        'imageUrl': 'https://images.unsplash.com/photo-1555507036-ab1f4038808a',
        'category': 'Bakery',
      },
      {
        'name': 'Chicken Curry',
        'description': 'Tender chicken pieces in a rich, aromatic curry sauce, served with basmati rice. A comforting Indian classic.',
        'price': '\$12.99',
        'rating': '4.6',
        'restaurant': 'Spice Garden',
        'imageUrl': 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398',
        'category': 'Indian',
      },
      {
        'name': 'Fruit Smoothie Bowl',
        'description': 'Blended fruits topped with fresh berries, granola, and honey. A healthy and refreshing breakfast option.',
        'price': '\$6.99',
        'rating': '4.5',
        'restaurant': 'Juice Bar',
        'imageUrl': 'https://images.unsplash.com/photo-1621263764928-df1444c5e859',
        'category': 'Healthy',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: foods.length,
      itemBuilder: (context, index) {
        final food = foods[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodDetailPage(food: food),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  child: Image.network(
                    food['imageUrl']!,
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food['name']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          food['restaurant']!,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              food['price']!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    food['rating']!,
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FoodDetailPage extends StatelessWidget {
  final Map<String, String> food;

  const FoodDetailPage({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                food['imageUrl']!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          food['name']!,
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 16,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              food['rating']!,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    food['restaurant']!,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    food['description']!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        food['price']!,
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<CartProvider>().addToCart(food);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Added to cart'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text('Add to Cart'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}