import 'package:flutter/material.dart';

class Company extends StatelessWidget {
  final List<Map<String, String>> companies = [
    {
      'name': 'Tata Consultancy Services',
      'location': 'Mumbai',
      'salaryRange': '₹3.5 LPA - ₹12 LPA',
      'profile': 'IT services, consulting and business solutions organization'
    },
    {
      'name': 'Infosys',
      'location': 'Bangalore',
      'salaryRange': '₹3.6 LPA - ₹11 LPA',
      'profile':
          'Provider of consulting, technology, outsourcing and next-generation digital services'
    },
    {
      'name': 'Wipro',
      'location': 'Bangalore',
      'salaryRange': '₹3.5 LPA - ₹10 LPA',
      'profile':
          'Global information technology, consulting and outsourcing company'
    },
    {
      'name': 'HCL Technologies',
      'location': 'Noida',
      'salaryRange': '₹3.0 LPA - ₹9 LPA',
      'profile': 'IT services and consulting company'
    },
    {
      'name': 'Accenture',
      'location': 'Mumbai',
      'salaryRange': '₹4.0 LPA - ₹13 LPA',
      'profile':
          'Professional services company with capabilities in consulting, technology and operations'
    },
    {
      'name': 'Capgemini',
      'location': 'Mumbai',
      'salaryRange': '₹3.8 LPA - ₹12 LPA',
      'profile':
          'Multinational corporation providing consulting, technology, professional, and outsourcing services'
    },
    {
      'name': 'Tech Mahindra',
      'location': 'Pune',
      'salaryRange': '₹3.2 LPA - ₹10 LPA',
      'profile': 'Information technology services and consulting company'
    },
    {
      'name': 'Oracle',
      'location': 'Bangalore',
      'salaryRange': '₹6 LPA - ₹20 LPA',
      'profile': 'Multinational computer technology corporation'
    },
    {
      'name': 'Microsoft',
      'location': 'Hyderabad',
      'salaryRange': '₹7 LPA - ₹25 LPA',
      'profile':
          'Multinational technology corporation which produces computer software, consumer electronics, personal computers, and related services'
    },
    {
      'name': 'Amazon',
      'location': 'Bangalore',
      'salaryRange': '₹8 LPA - ₹30 LPA',
      'profile':
          'Multinational technology company focusing on e-commerce, cloud computing, online advertising, digital streaming, and artificial intelligence'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: companies.length,
        itemBuilder: (context, index) {
          final company = companies[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.business,
                        size: 32,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          company['name']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Location: ${company['location']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Salary Range: ${company['salaryRange']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Profile: ${company['profile']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Implement view more details action here
                  //   },
                  //   child: const Text('View Details'),
                  //   style: ElevatedButton.styleFrom(
                  //     backgroundColor: Colors.blueAccent,
                  //     padding: const EdgeInsets.symmetric(vertical: 10.0),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
