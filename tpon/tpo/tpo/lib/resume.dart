import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class Resume extends StatelessWidget {
  final PlatformFile resumeFile;

  Resume({required this.resumeFile});

  void _openResume() {
    OpenFile.open(resumeFile.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Resume'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title section
            Text(
              'My Resume',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 10),
            // Resume File Name
            Text(
              'Resume: ${resumeFile.name}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20),
            // Button to view the resume
            ElevatedButton(
              onPressed: _openResume,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.blueAccent, // Button Color
              ),
              child: Text(
                'View Resume',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 30),
            // Add a bit of spacing for better visual appeal
          ],
        ),
      ),
    );
  }
}
