import 'package:flutter/material.dart';
import 'package:ewebsite/models/product.dart';
import 'package:ewebsite/screens/product_detail_screen.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Enhanced product data
    final List<Product> products = [
      Product(
        id: '1',
        name: 'Espresso Roast',
        description:
            'Perfectly roasted for a rich, intense flavor. Ideal for espresso machines, offering a strong, bold taste with low acidity.',
        price: 4.50,
        imageUrl:
            'https://imgs.search.brave.com/8BQjl5hve0epo-wYfedfkLbFZocNcicYd6cEfGqX28s/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/dGFzdGVvZmhvbWUu/Y29tL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDIzLzAzL1RPSC1l/c3ByZXNzby1HZXR0/eUltYWdlcy0xMjkx/Mjk4MzE1LUpWY3Jv/cC5qcGc',
      ),
      Product(
        id: '2',
        name: 'Breakfast Blend',
        description:
            'A smooth, clean, and consistent medium roast, perfect for starting your day. Expect nutty hints with mild fruity tones and a gentle cocoa aftertaste .',
        price: 5.00,
        imageUrl:
            'https://imgs.search.brave.com/Sk6aUBkDSipxunSX3gsmYLhAG3EAmfNkn10vs6Nmlow/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vcGljanVt/Ym8uY29tL3dwLWNv/bnRlbnQvdXBsb2Fk/cy9oZWFsdGh5LWJy/ZWFrZmFzdC1pbmdy/ZWRpZW50cy1mcmVl/LXBob3RvLmpwZz93/PTYwMCZxdWFsaXR5/PTgw',
      ),
      Product(
        id: '3',
        name: 'Cafe Latte',
        description:
            'A classic coffee beverage of espresso and steamed milk. Customize it with your favorite flavorings, such as vanilla or caramel.',
        price: 6.00,
        imageUrl:
            'https://imgs.search.brave.com/BVCN4_hQmxwUgKsEbIkks5_KnCZB1sPvf2Tu7OgSlUs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/YWxscmVjaXBlcy5j/b20vdGhtYi9DRUI3/VjVKNC1YTUdCR1VH/ZjZ3M1pid2VkaWM9/LzB4NTEyL2ZpbHRl/cnM6bm9fdXBzY2Fs/ZSgpOm1heF9ieXRl/cygxNTAwMDApOnN0/cmlwX2ljYygpLzk2/NjI5LWNhZmUtbGF0/dGUtZGRtZnMtaGVy/by00eDMtMDI4ODM1/OWQ5YzM3NDg1ZmE2/OWFmZTUzNjlkYmNm/MmUuanBn',
      ),
      Product(
        id: '4',
        name: 'Cappuccino',
        description:
            'Espresso with steamed milk and a thick, frothy foam. Enjoy it plain or with a sprinkle of cocoa.',
        price: 5.50,
        imageUrl:
            'https://imgs.search.brave.com/Ab9hcV0nukIPeY854gH4lVgAcGITF3HpoacMSVjUUwk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzAzLzYwLzY0LzA0/LzM2MF9GXzM2MDY0/MDQ2OF9aRDZuSU12/WVE5RUVEaUhEZVo5/SUd4THNaajkxNHdj/VC5qcGc',
      ),
      Product(
        id: '5',
        name: 'Chai Latte',
        description:
            'A warm and comforting blend of chai tea spices and steamed milk. Aromatic and delicious, perfect for a cozy treat.',
        price: 4.75,
        imageUrl:
            'https://imgs.search.brave.com/ScqAJiGXROtBpRomnoBHU2KSVIE4DaBmIRI5lHzEFa4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9j/dXAtY29mZmVlLXdp/dGgtY2lubmFtb24t/c3RpY2tzLW1hcmJs/ZS1iYWNrZ3JvdW5k/LWhpZ2gtcXVhbGl0/eS1waG90b18xMTQ1/NzktMzc0OTEuanBn/P3NlbXQ9YWlzX2h5/YnJpZA',
      ),
      Product(
        id: '6',
        name: 'Hot Chocolate',
        description:
            'Rich, creamy, and decadent. Our hot chocolate is the perfect indulgence, topped with whipped cream and marshmallows.',
        price: 5.25,
        imageUrl:
            'https://imgs.search.brave.com/rSY7kVpQarotpOlcBddlBgUXA_-p2jrcYLvNsRMPQoU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA5LzU2LzMzLzEx/LzM2MF9GXzk1NjMz/MTEwOF9ocmZLR2Ju/eDI3SVVzOHZ2emJM/SHlTY21UejY3WjFa/Qi5qcGc',
      ),
      Product(
        id: '7',
        name: 'Pastries',
        description:
            'A delightful assortment of fresh-baked pastries, including croissants, muffins, and scones. Perfect to enjoy with your coffee.',
        price: 5.75,
        imageUrl:
            'https://imgs.search.brave.com/TNy4WJffuuAra_kdLkQXNBDz2fhiPh7rV6J2i0KQUss/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvNTE4/NDY4NjM1L3Bob3Rv/L2ZyZW5jaC1wYXN0/cmllcy1vbi1kaXNw/bGF5LWEtY29uZmVj/dGlvbmVyeS1zaG9w/LmpwZz9zPTYxMng2/MTImdz0wJms9MjAm/Yz1hdjdyWVJDTGNr/dkRwNnM5c0dtQV9T/OUxwX2ZUU0RTU090/bVIwd1dKOG5ZPQ',
      ),
      Product(
        id: '8',
        name: 'Sandwiches',
        description:
            'Freshly made sandwiches with a variety of fillings, from classic deli meats to vegetarian options. A satisfying meal on the go.',
        price: 6.25,
        imageUrl:
            'https://imgs.search.brave.com/EKzitBEQfLI-LixlG7CAP7JM15BLF794qXx2UqRXdK0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNzQ4/MzM2MjIzL3Bob3Rv/L3ZlZ2V0YWJsZS1z/YW5kd2ljaC5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9eUJn/a0R0cXhlT3BKTm9L/RlVVM05ja0RZZEcy/aTA0YjNhOGJMV3dT/SHd0Zz0',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Coffee'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          childAspectRatio: 0.75, // Adjust as needed
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailScreen(product: product),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${product.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
