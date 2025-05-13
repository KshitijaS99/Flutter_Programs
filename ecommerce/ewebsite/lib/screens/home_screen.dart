import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample featured product data (replace with your actual data)
    final List<FeaturedProduct> featuredProducts = [
      FeaturedProduct(
          name: 'Espresso Roast',
          imageUrl:
              'https://imgs.search.brave.com/8BQjl5hve0epo-wYfedfkLbFZocNcicYd6cEfGqX28s/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/dGFzdGVvZmhvbWUu/Y29tL3dwLWNvbnRl/bnQvdXBsb2Fkcy8y/MDIzLzAzL1RPSC1l/c3ByZXNzby1HZXR0/eUltYWdlcy0xMjkx/Mjk4MzE1LUpWY3Jv/cC5qcGc'),
      FeaturedProduct(
          name: 'Breakfast Blend',
          imageUrl:
              'https://imgs.search.brave.com/Sk6aUBkDSipxunSX3gsmYLhAG3EAmfNkn10vs6Nmlow/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pMC53/cC5jb20vcGljanVt/Ym8uY29tL3dwLWNv/bnRlbnQvdXBsb2Fk/cy9oZWFsdGh5LWJy/ZWFrZmFzdC1pbmdy/ZWRpZW50cy1mcmVl/LXBob3RvLmpwZz93/PTYwMCZxdWFsaXR5/PTgw'),
      FeaturedProduct(
          name: 'Cafe Latte',
          imageUrl:
              'https://imgs.search.brave.com/BVCN4_hQmxwUgKsEbIkks5_KnCZB1sPvf2Tu7OgSlUs/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/YWxscmVjaXBlcy5j/b20vdGhtYi9DRUI3/VjVKNC1YTUdCR1VH/ZjZ3M1pid2VkaWM9/LzB4NTEyL2ZpbHRl/cnM6bm9fdXBzY2Fs/ZSgpOm1heF9ieXRl/cygxNTAwMDApOnN0/cmlwX2ljYygpLzk2/NjI5LWNhZmUtbGF0/dGUtZGRtZnMtaGVy/by00eDMtMDI4ODM1/OWQ5YzM3NDg1ZmE2/OWFmZTUzNjlkYmNm/MmUuanBn'),
      FeaturedProduct(
          name: 'Cappuccino',
          imageUrl:
              'https://imgs.search.brave.com/Ab9hcV0nukIPeY854gH4lVgAcGITF3HpoacMSVjUUwk/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzAzLzYwLzY0LzA0/LzM2MF9GXzM2MDY0/MDQ2OF9aRDZuSU12/WVE5RUVEaUhEZVo5/SUd4THNaajkxNHdj/VC5qcGc'),
      FeaturedProduct(
          name: 'Chai Latte',
          imageUrl:
              'https://imgs.search.brave.com/ScqAJiGXROtBpRomnoBHU2KSVIE4DaBmIRI5lHzEFa4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pbWcu/ZnJlZXBpay5jb20v/ZnJlZS1waG90by9j/dXAtY29mZmVlLXdp/dGgtY2lubmFtb24t/c3RpY2tzLW1hcmJs/ZS1iYWNrZ3JvdW5k/LWhpZ2gtcXVhbGl0/eS1waG90b18xMTQ1/NzktMzc0OTEuanBn/P3NlbXQ9YWlzX2h5/YnJpZA'),
      FeaturedProduct(
          name: 'Hot Chocolate',
          imageUrl:
              'https://imgs.search.brave.com/rSY7kVpQarotpOlcBddlBgUXA_-p2jrcYLvNsRMPQoU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA5LzU2LzMzLzEx/LzM2MF9GXzk1NjMz/MTEwOF9ocmZLR2Ju/eDI3SVVzOHZ2emJM/SHlTY21UejY3WjFa/Qi5qcGc'),
      FeaturedProduct(
          name: 'Pastries ',
          imageUrl:
              'https://imgs.search.brave.com/TNy4WJffuuAra_kdLkQXNBDz2fhiPh7rV6J2i0KQUss/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvNTE4/NDY4NjM1L3Bob3Rv/L2ZyZW5jaC1wYXN0/cmllcy1vbi1kaXNw/bGF5LWEtY29uZmVj/dGlvbmVyeS1zaG9w/LmpwZz9zPTYxMng2/MTImdz0wJms9MjAm/Yz1hdjdyWVJDTGNr/dkRwNnM5c0dtQV9T/OUxwX2ZUU0RTU090/bVIwd1dKOG5ZPQ'),
      FeaturedProduct(
          name: 'Sandwiches ',
          imageUrl:
              'https://imgs.search.brave.com/EKzitBEQfLI-LixlG7CAP7JM15BLF794qXx2UqRXdK0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNzQ4/MzM2MjIzL3Bob3Rv/L3ZlZ2V0YWJsZS1z/YW5kd2ljaC5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9eUJn/a0R0cXhlT3BKTm9L/RlVVM05ja0RZZEcy/aTA0YjNhOGJMV3dT/SHd0Zz0'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Shop'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Explore our finest coffee selections.',
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/browse'); // Direct navigation
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text(
                'Browse Products',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Featured Products',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Display featured products in a GridView
            GridView.builder(
              shrinkWrap: true, // Important to use with SingleChildScrollView
              physics:
                  const NeverScrollableScrollPhysics(), // Disable GridView's scrolling
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns in the grid
                childAspectRatio: 0.8, // Adjust as needed
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: featuredProducts.length,
              itemBuilder: (context, index) {
                final product = featuredProducts[index];
                return _buildFeaturedProductCard(product);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build a featured product card
  Widget _buildFeaturedProductCard(FeaturedProduct product) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

// Helper class to represent a featured product
class FeaturedProduct {
  final String name;
  final String imageUrl;

  FeaturedProduct({required this.name, required this.imageUrl});
}
