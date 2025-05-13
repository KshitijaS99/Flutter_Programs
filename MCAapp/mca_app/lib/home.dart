import 'package:flutter/material.dart';
import 'faculty.dart';
import 'vissionmission.dart';
import 'feedback.dart';
import 'notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MCA Department',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        elevation: 4, // Slightly elevated for a professional shadow
        backgroundColor: Colors.blue[700],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[700],
              ),
              child: const Text(
                'Master of Computer Application',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.group, color: Colors.blue[700]),
              title: const Text('Faculties', style: TextStyle(fontSize: 16)),
              selected: _selectedIndex == 0,
              selectedTileColor: Colors.blue[50], // Highlight selected item
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.featured_play_list, color: Colors.blue[700]),
              title: const Text('Vision and Mission',
                  style: TextStyle(fontSize: 16)),
              selected: _selectedIndex == 1,
              selectedTileColor: Colors.blue[50],
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.blue[700]),
              title: const Text('Notification', style: TextStyle(fontSize: 16)),
              selected: _selectedIndex == 2,
              selectedTileColor: Colors.blue[50],
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.feed, color: Colors.blue[700]),
              title: const Text('Feedback', style: TextStyle(fontSize: 16)),
              selected: _selectedIndex == 3,
              selectedTileColor: Colors.blue[50],
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: _buildPage(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Sync with drawer
        selectedItemColor: Colors.blue[700], // Updated to blue[700]
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed, // Fixed type for more than 3 items
        backgroundColor: Colors.white, // Clean white background
        elevation: 4, // Slight elevation for professionalism
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Faculties',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.featured_play_list),
            label: 'Vision & Mission',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Feedback',
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return FacultyPage();
      case 1:
        return const VissionMissionPage();
      case 2:
        return NotificationPage();
      case 3:
        return const FeedBackPage();
      default:
        return const Center(child: Text('Invalid Page'));
    }
  }
}
