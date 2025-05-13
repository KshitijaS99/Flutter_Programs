import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:tpo/home.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _rollNoController = TextEditingController();
  final TextEditingController _hscCollegeController = TextEditingController();
  final TextEditingController _hscYearController = TextEditingController();
  final TextEditingController _hscTotalController = TextEditingController();
  final TextEditingController _hscOutOfController = TextEditingController();
  final TextEditingController _sscCollegeController = TextEditingController();
  final TextEditingController _sscYearController = TextEditingController();
  final TextEditingController _sscTotalController = TextEditingController();
  final TextEditingController _sscOutOfController = TextEditingController();
  final TextEditingController _sem1CgpaController = TextEditingController();
  final TextEditingController _sem2CgpaController = TextEditingController();
  final TextEditingController _sem3CgpaController = TextEditingController();
  final TextEditingController _sem4CgpaController = TextEditingController();
  final TextEditingController _sem5CgpaController = TextEditingController();
  final TextEditingController _additionalCoursesController =
      TextEditingController();

  PlatformFile? _resumeFile;

  Future<void> _pickResume() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        _resumeFile = result.files.first;
      });
    }
  }

  void _submit() {
    if (_resumeFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            name: _nameController.text,
            email: _emailController.text,
            contact: _contactController.text,
            rollNo: _rollNoController.text,
            hscCollege: _hscCollegeController.text,
            hscYear: _hscYearController.text,
            hscTotal: _hscTotalController.text,
            hscOutOf: _hscOutOfController.text,
            sscCollege: _sscCollegeController.text,
            sscYear: _sscYearController.text,
            sscTotal: _sscTotalController.text,
            sscOutOf: _sscOutOfController.text,
            sem1Cgpa: _sem1CgpaController.text,
            sem2Cgpa: _sem2CgpaController.text,
            sem3Cgpa: _sem3CgpaController.text,
            sem4Cgpa: _sem4CgpaController.text,
            sem5Cgpa: _sem5CgpaController.text,
            additionalCourses: _additionalCoursesController.text,
            resumeFile: _resumeFile!,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please upload a resume')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Form'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(_nameController, 'Enter your name'),
              _buildTextField(_emailController, 'Enter your email'),
              _buildTextField(_contactController, 'Enter your contact number'),
              _buildTextField(_rollNoController, 'Enter your roll number'),
              const SizedBox(height: 20),
              _buildSectionHeader('HSC Details'),
              _buildTextField(_hscCollegeController, 'College'),
              _buildTextField(_hscYearController, 'Year of Passing'),
              _buildTextField(_hscTotalController, 'Total Marks'),
              _buildTextField(_hscOutOfController, 'Out of Marks'),
              const SizedBox(height: 20),
              _buildSectionHeader('SSC Details'),
              _buildTextField(_sscCollegeController, 'College'),
              _buildTextField(_sscYearController, 'Year of Passing'),
              _buildTextField(_sscTotalController, 'Total Marks'),
              _buildTextField(_sscOutOfController, 'Out of Marks'),
              const SizedBox(height: 20),
              _buildSectionHeader('Semester CGPA'),
              _buildTextField(_sem1CgpaController, 'Semester 1'),
              _buildTextField(_sem2CgpaController, 'Semester 2'),
              _buildTextField(_sem3CgpaController, 'Semester 3'),
              _buildTextField(_sem4CgpaController, 'Semester 4'),
              _buildTextField(_sem5CgpaController, 'Semester 5'),
              const SizedBox(height: 20),
              _buildTextField(
                  _additionalCoursesController, 'Additional Courses'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _pickResume,
                child: const Text('Upload Resume (PDF)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
              if (_resumeFile != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text('Uploaded: ${_resumeFile!.name}'),
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resumeFile != null ? _submit : null,
                child: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.blueAccent),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
