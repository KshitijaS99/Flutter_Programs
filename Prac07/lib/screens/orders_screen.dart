import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.primary,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[700],
              tabs: const [Tab(text: 'Ongoing'), Tab(text: 'History')],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildOngoingOrders(context),
                _buildOrderHistory(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOngoingOrders(BuildContext context) {
    // Sample ongoing orders
    final ongoingOrders = [
      {
        'id': '#12345',
        'restaurant': 'Burger King',
        'items': '2x Double Cheese Burger, 1x French Fries, 1x Milkshake',
        'total': '\$29.66',
        'status': 'On the way',
        'time': '15 min',
        'image': 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/14/f8/c3/c5/burger-king-lakeland.jpg?w=900&h=500&s=1',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: ongoingOrders.length,
      itemBuilder: (context, index) {
        final order = ongoingOrders[index];
        return _buildOrderCard(
          context,
          order['id'] as String,
          order['restaurant'] as String,
          order['items'] as String,
          order['total'] as String,
          order['status'] as String,
          order['time'] as String,
          order['image'] as String,
          isOngoing: true,
        );
      },
    );
  }

  Widget _buildOrderHistory(BuildContext context) {
    // Sample order history
    final orderHistory = [
      {
        'id': '#12344',
        'restaurant': 'Pizza Hut',
        'items': '1x Pepperoni Pizza, 1x Garlic Bread',
        'total': '\$21.99',
        'status': 'Delivered',
        'time': 'Yesterday, 7:30 PM',
        'image': 'https://www.qsrmagazine.com/wp-content/uploads/2023/11/pizzahutrestaurant-552x312.jpg',
      },
      {
        'id': '#12343',
        'restaurant': 'Subway',
        'items': '1x Veggie Sub, 1x Cookie, 1x Soda',
        'total': '\$12.99',
        'status': 'Delivered',
        'time': 'Apr 12, 1:15 PM',
        'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2FoskxGD1WoTYii8_9PYiz4hg4_z5b4du7w&s',
      },
      {
        'id': '#12342',
        'restaurant': 'KFC',
        'items': '1x Chicken Bucket, 2x Coleslaw',
        'total': '\$26.49',
        'status': 'Delivered',
        'time': 'Apr 10, 8:20 PM',
        'image': 'https://e-noticies.cat/filesedc/uploads/image/post/facana-exterior-kfc-restaurant_1200_800.webp',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orderHistory.length,
      itemBuilder: (context, index) {
        final order = orderHistory[index];
        return _buildOrderCard(
          context,
          order['id'] as String,
          order['restaurant'] as String,
          order['items'] as String,
          order['total'] as String,
          order['status'] as String,
          order['time'] as String,
          order['image'] as String,
          isOngoing: false,
        );
      },
    );
  }

  Widget _buildOrderCard(
    BuildContext context,
    String id,
    String restaurant,
    String items,
    String total,
    String status,
    String time,
    String imageUrl, {
    required bool isOngoing,
  }) {
    Color statusColor = Theme.of(context).colorScheme.primary;
    if (status == 'Delivered') {
      statusColor = Theme.of(context).colorScheme.tertiary;
    } else if (status == 'Cancelled') {
      statusColor = Colors.red;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            restaurant,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            id,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        items,
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: statusColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                status,
                                style: TextStyle(
                                  color: statusColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            time,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
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
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: $total',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                if (isOngoing)
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    child: Text(
                      'Track Order',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  )
                else
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    child: Text(
                      'Reorder',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}