import 'package:flutter/material.dart';
import '/screens/restaurant_view_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Popular restaurants
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Restaurants',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildRestaurantList(context),
        ],
      ),
    );
  }

  Widget _buildRestaurantList(BuildContext context) {
    final restaurants = [
      {
        'name': 'Burger King',
        'category': 'Burgers, Fast Food',
        'rating': '4.5',
        'deliveryTime': '20-30 min',
        'imageUrl': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/f8/c3/c5/burger-king-lakeland.jpg?w=900&h=500&s=1',
      },
      {
        'name': 'Pizza Hut',
        'category': 'Pizza, Italian',
        'rating': '4.2',
        'deliveryTime': '25-35 min',
        'imageUrl': 'https://www.qsrmagazine.com/wp-content/uploads/2023/11/pizzahutrestaurant-552x312.jpg',
      },
      {
        'name': 'Subway',
        'category': 'Healthy, Sandwiches',
        'rating': '4.0',
        'deliveryTime': '15-25 min',
        'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2FoskxGD1WoTYii8_9PYiz4hg4_z5b4du7w&s',
      },
      {
        'name': 'KFC',
        'category': 'Chicken, Fast Food',
        'rating': '4.4',
        'deliveryTime': '25-35 min',
        'imageUrl': 'https://e-noticies.cat/filesedc/uploads/image/post/facana-exterior-kfc-restaurant_1200_800.webp',
      },
      {
        'name': 'Starbucks',
        'category': 'Coffee, Cafe',
        'rating': '4.6',
        'deliveryTime': '15-25 min',
        'imageUrl': 'https://images.unsplash.com/photo-1631214524020-3c8167dae7c3',
      },
      {
        'name': 'Dunkin\' Donuts',
        'category': 'Bakery, Coffee',
        'rating': '4.1',
        'deliveryTime': '15-25 min',
        'imageUrl': 'https://images.unsplash.com/photo-1578985545062-69928b1d9587',
      },
    ];

    return Column(
      children: restaurants.map((restaurant) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantViewPage(
                  name: restaurant['name']!,
                  category: restaurant['category']!,
                  rating: restaurant['rating']!,
                  deliveryTime: restaurant['deliveryTime']!,
                  imageUrl: restaurant['imageUrl']!,
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withAlpha(26),
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
                    restaurant['imageUrl']!,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              restaurant['name']!,
                              style: const TextStyle(
                                fontSize: 18,
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
                              color: Theme.of(context).colorScheme.primary.withAlpha(26),
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
                                  restaurant['rating']!,
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
                      const SizedBox(height: 4),
                      Text(
                        restaurant['category']!,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            restaurant['deliveryTime']!,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}