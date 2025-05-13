import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:tpo/resume.dart';
import 'company.dart';

class HomePage extends StatefulWidget {
  final String name;
  final String email;
  final String contact;
  final String rollNo;
  final String hscCollege;
  final String hscYear;
  final String hscTotal;
  final String hscOutOf;
  final String sscCollege;
  final String sscYear;
  final String sscTotal;
  final String sscOutOf;
  final String sem1Cgpa;
  final String sem2Cgpa;
  final String sem3Cgpa;
  final String sem4Cgpa;
  final String sem5Cgpa;
  final String additionalCourses;
  final PlatformFile resumeFile;

  const HomePage(
      {super.key,
      required this.name,
      required this.email,
      required this.contact,
      required this.rollNo,
      required this.hscCollege,
      required this.hscYear,
      required this.hscTotal,
      required this.hscOutOf,
      required this.sscCollege,
      required this.sscYear,
      required this.sscTotal,
      required this.sscOutOf,
      required this.sem1Cgpa,
      required this.sem2Cgpa,
      required this.sem3Cgpa,
      required this.sem4Cgpa,
      required this.sem5Cgpa,
      required this.additionalCourses,
      required this.resumeFile});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TPO Portal'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: Text(
                'TPO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('My Profile'),
              selected: _selectedIndex == 0,
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.description),
              title: const Text('My Resume'),
              selected: _selectedIndex == 1,
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.business),
              title: const Text('Companies'),
              selected: _selectedIndex == 2,
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _buildPage(_selectedIndex),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0: // My Profile
        return _ProfilePage(
          widget: widget,
        );
      case 1: // My Resume
        return Resume(resumeFile: widget.resumeFile);
      case 2: // Companies
        return Company();
      default:
        return const Center(child: Text('Invalid Page'));
    }
  }
}

class _ProfilePage extends StatelessWidget {
  final HomePage widget;

  const _ProfilePage({required this.widget});

  @override
  Widget build(BuildContext context) {
    double hscPercentage =
        double.parse(widget.hscTotal) / double.parse(widget.hscOutOf) * 100;
    double sscPercentage =
        double.parse(widget.sscTotal) / double.parse(widget.sscOutOf) * 100;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileCard("Personal Information", [
              _buildProfileRow("Name", widget.name),
              _buildProfileRow("Email", widget.email),
              _buildProfileRow("Contact", widget.contact),
              _buildProfileRow("Roll No", widget.rollNo),
            ]),
            SizedBox(height: 20),
            _buildProfileCard("HSC Details", [
              _buildProfileRow("College", widget.hscCollege),
              _buildProfileRow("Year of Passing", widget.hscYear),
              _buildProfileRow("Total Marks", widget.hscTotal),
              _buildProfileRow("Out of Marks", widget.hscOutOf),
              _buildProfileRow(
                  "Percentage", '${hscPercentage.toStringAsFixed(2)}%'),
            ]),
            SizedBox(height: 20),
            _buildProfileCard("SSC Details", [
              _buildProfileRow("College", widget.sscCollege),
              _buildProfileRow("Year of Passing", widget.sscYear),
              _buildProfileRow("Total Marks", widget.sscTotal),
              _buildProfileRow("Out of Marks", widget.sscOutOf),
              _buildProfileRow(
                  "Percentage", '${sscPercentage.toStringAsFixed(2)}%'),
            ]),
            SizedBox(height: 20),
            _buildProfileCard("Semester CGPA", [
              _buildProfileRow("Semester 1", widget.sem1Cgpa),
              _buildProfileRow("Semester 2", widget.sem2Cgpa),
              _buildProfileRow("Semester 3", widget.sem3Cgpa),
              _buildProfileRow("Semester 4", widget.sem4Cgpa),
              _buildProfileRow("Semester 5", widget.sem5Cgpa),
            ]),
            SizedBox(height: 20),
            _buildProfileCard("Additional Information", [
              _buildProfileRow("Additional Courses", widget.additionalCourses),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(String title, List<Widget> rows) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(),
            ...rows,
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 150,
              child: Text(
                "$label:",
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
