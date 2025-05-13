import 'package:flutter/material.dart';
import 'feedback_form.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                // Profile Header
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage('assets/about-pic1.png'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Kshitija Saitavdekar',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Data Analyst | PR Head [ACSES]',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Contact Information
                _buildInfoCard(
                  title: 'Contact Information',
                  children: [
                    _buildInfoRow(
                        Icons.email, 'kshitijasaitavdekar009@gmail.com'),
                    _buildInfoRow(Icons.phone, '+91 8689949235'),
                    _buildInfoRow(Icons.location_on, 'Mumbai, India'),
                  ],
                ),

                // Education
                _buildInfoCard(
                  title: 'Education',
                  children: [
                    _buildInfoRow(Icons.school,
                        'MCA, Sardar Patel Institute of Technology'),
                    _buildInfoRow(
                        Icons.school, 'BSc IT, Patkar College (CGPA: 9.68/10)'),
                  ],
                ),

                // Internship
                _buildInfoCard(
                  title: 'Internship Experience',
                  children: [
                    _buildInfoRow(
                        Icons.business, 'Content Reviewer Intern, InnovSense'),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, top: 6),
                      child: Text(
                        'Reviewed a Python Data Structures course & \nhelped train a machine-learning model for Hindi tutorials.',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ),
                  ],
                ),

                // Projects
                _buildInfoCard(
                  title: 'Projects',
                  children: [
                    _buildProjectRow('Smart Cradle',
                        'Detects infant cries using AI, monitors temperature & humidity.'),
                    _buildProjectRow('Anonymous Sphere',
                        'Secure, anonymous chat platform with institutional login.'),
                  ],
                ),

                // Publications
                _buildInfoCard(
                  title: 'Research Publications',
                  children: [
                    _buildPublicationRow(
                        'Cloud Computing: A Review', 'JETIR Journal'),
                    _buildPublicationRow(
                        'Anonymous Sphere: P2P Learning', 'IRJMST Journal'),
                  ],
                ),

                SizedBox(height: 20),

                // Feedback Button
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackForm()),
                    );
                  },
                  icon: Icon(Icons.feedback),
                  label: Text('Submit Feedback'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(
      {required String title, required List<Widget> children}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectRow(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4),
          Text(description,
              style: TextStyle(fontSize: 14, color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildPublicationRow(String title, String journal) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Text(
        '$title ($journal)',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}
