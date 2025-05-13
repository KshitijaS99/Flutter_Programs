import 'package:flutter/material.dart';
import 'review.dart';

class MovieReviewForm extends StatefulWidget {
  @override
  _MovieReviewFormState createState() => _MovieReviewFormState();
}

class _MovieReviewFormState extends State<MovieReviewForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _dobController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _reviewController = TextEditingController();
  int _rating = 0;
  String _gender = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_gender.isEmpty || _rating == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please select gender and provide a rating!'),
            backgroundColor: Colors.redAccent,
          ),
        );
        return;
      }

      final data = {
        'Name': _nameController.text,
        'Surname': _surnameController.text,
        'DOB': _dobController.text,
        'Address': _addressController.text,
        'Email': _emailController.text,
        'Phone': _phoneController.text,
        'Gender': _gender,
        'Review': _reviewController.text,
        'Rating': _rating,
      };

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Submission Successful!'),
          content: Text('Your review has been submitted successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ReviewDisplayPage(data: data),
                  ),
                );
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('This is a Snackbar!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Fan Button Clicked'),
        content: Text('This is an alert dialog after clicking the fan button.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text('Movie Review Form',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Submit Your Review',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildTextField(_nameController, 'Name', Icons.person),
                    _buildTextField(
                        _surnameController, 'Surname', Icons.person),
                    _buildDateField(),
                    _buildTextField(_addressController, 'Address', Icons.home,
                        isMultiLine: true),
                    _buildTextField(_emailController, 'Email', Icons.email,
                        inputType: TextInputType.emailAddress),
                    _buildTextField(
                        _phoneController, 'Phone Number', Icons.phone,
                        inputType: TextInputType.phone),
                    _buildGenderField(),
                    _buildRatingField(),
                    _buildTextField(
                        _reviewController, 'Review', Icons.text_snippet,
                        isMultiLine: true),
                    SizedBox(height: 20),
                    _buildSubmitButton(),
                    SizedBox(height: 20),
                    _buildSnackbarButton(),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: _showDialog, // Call the dialog box function here
              backgroundColor: Colors.redAccent,
              child: Icon(Icons.favorite, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon,
      {bool isMultiLine = false,
      TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          prefixIcon: Icon(icon, color: Colors.blueAccent),
          filled: true,
          fillColor: Colors.white,
        ),
        keyboardType: inputType,
        maxLines: isMultiLine ? null : 1,
        validator: (value) => value!.isEmpty ? '$label is required' : null,
      ),
    );
  }

  Widget _buildDateField() {
    return _buildTextField(
        _dobController, 'Date of Birth', Icons.calendar_today);
  }

  Widget _buildGenderField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Gender',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Row(
            children: [
              _buildGenderOption('Male'),
              _buildGenderOption('Female'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGenderOption(String gender) {
    return Expanded(
      child: RadioListTile<String>(
        title: Text(gender),
        value: gender,
        groupValue: _gender,
        activeColor: Colors.blueAccent,
        onChanged: (value) => setState(() => _gender = value!),
      ),
    );
  }

  Widget _buildRatingField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rating',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(Icons.star,
                    color:
                        _rating > index ? Colors.amber : Colors.grey.shade400,
                    size: 30),
                onPressed: () => setState(() => _rating = index + 1),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: ElevatedButton(
        onPressed: _submitForm,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child:
            Text('Submit', style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }

  Widget _buildSnackbarButton() {
    return Center(
      child: ElevatedButton(
        onPressed: _showSnackbar,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Text('Show Snackbar',
            style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
