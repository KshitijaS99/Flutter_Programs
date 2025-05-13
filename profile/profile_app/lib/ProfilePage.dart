import 'package:flutter/material.dart';
import 'FeedbackPage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              color: Colors.blueAccent,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        AssetImage('assets/images/profile-pic1.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Kshitija Saitavdekar',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Student',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/linkedin.png'),
                        iconSize: 30,
                        onPressed: () {
                          // Handle LinkedIn link
                        },
                      ),
                      IconButton(
                        icon: Image.asset('assets/images/github.png'),
                        iconSize: 30,
                        onPressed: () {
                          // Handle GitHub link
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Handle CV download
                    },
                    child: Text('Download CV'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle contact info
                    },
                    child: Text('Contact Info'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // About Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Me',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Hello, I'm Kshitija Saitavdekar. I'm currently pursuing my MCA at Sardar Patel College and hold a B.Sc.I.T degree from Patkar Varde College. I have a month's experience as a Reviewer.",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Hobbies Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hobbies',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 4.0,
                    children: [
                      Chip(label: Text('Reading')),
                      Chip(label: Text('Cooking')),
                      Chip(label: Text('Learning Languages')),
                      Chip(label: Text('Driving')),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Research Papers Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Research Papers',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildPaperTile(
                    title: 'CLOUD COMPUTING: A REVIEW',
                    image: 'assets/images/CC11.jpg',
                    certificateLink:
                        'https://drive.google.com/file/d/1FuYJqUn1jSlrHUTZrc_G7942BDKeoWRK/view',
                    journalLink:
                        'https://www.jetir.org/view.php?paper=JETIRFY06027',
                  ),
                  _buildPaperTile(
                    title: 'ANONYMOUS SPHERE ELEVATING PEER-TO-PEER LEARNING',
                    image: 'assets/images/AS22.jpg',
                    certificateLink:
                        'https://drive.google.com/file/d/1_FR0ysmDV3Vz7DDk6l7NEMxlH1EnhtV3/view',
                    journalLink: 'http://www.irjmst.com/abstractview/18650',
                  ),
                  _buildPaperTile(
                    title:
                        'KITCHENWHIZ: A SMART KITCKEN AUTOMATION ROBOT REVOLUTIONIZING HOME COOKING THROUGH ROBOTICS',
                    image: 'assets/images/KW3.jpg',
                    certificateLink:
                        'https://drive.google.com/file/d/1NpZlHIeM3LI8jvevXEOzkbOZ4Ih8XNyY/view',
                    journalLink: 'http://www.irjmst.com/abstractview/18644',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Contact Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Me',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 10),
                      Text('Example@gmail.com'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.link),
                      SizedBox(width: 10),
                      Text('LinkedIn'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackPage()),
                  );
                },
                child: Text('Give Feedback'),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPaperTile(
      {required String title,
      required String image,
      required String certificateLink,
      required String journalLink}) {
    return Column(
      children: [
        ListTile(
          leading: Image.asset(image),
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  // Handle certificate link
                },
                child: Text('Certificate'),
              ),
              TextButton(
                onPressed: () {
                  // Handle journal link
                },
                child: Text('Journal'),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
