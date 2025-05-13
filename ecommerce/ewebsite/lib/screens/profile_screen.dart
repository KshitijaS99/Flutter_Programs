import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Sample profile data (replace with actual data)
  final String userName = 'Kshitija Saitavdekar';
  final String email = 'nnka279@gmail.com';
  final String profileImage =
      'assets/images/about-pic1.jpg'; // Specify asset image here
  String address = 'Malad West, Mumbai';
  String phoneNumber = '+91 8689949235';
  String dateOfBirth = 'September 27, 2003';
  String gender = 'Female';

  // Function to show edit dialog
  Future<void> _showEditDialog(
      String fieldName, String currentValue, Function(String) onSave) async {
    TextEditingController controller =
        TextEditingController(text: currentValue);
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit $fieldName'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter new $fieldName'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                onSave(controller.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  // CircleAvatar(
                  //   radius: 50,
                  //   backgroundImage: AssetImage(profileImage),
                  // ),
                  const SizedBox(height: 20), // Add distance here
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Account Information',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  // Address
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Address'),
                    subtitle: Text(address),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _showEditDialog('Address', address, (newValue) {
                          setState(() {
                            address = newValue;
                          });
                        });
                      },
                    ),
                  ),
                  // Phone Number
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: const Text('Phone Number'),
                    subtitle: Text(phoneNumber),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _showEditDialog('Phone Number', phoneNumber,
                            (newValue) {
                          setState(() {
                            phoneNumber = newValue;
                          });
                        });
                      },
                    ),
                  ),
                  // Date of Birth
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: const Text('Date of Birth'),
                    subtitle: Text(dateOfBirth),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _showEditDialog('Date of Birth', dateOfBirth,
                            (newValue) {
                          setState(() {
                            dateOfBirth = newValue;
                          });
                        });
                      },
                    ),
                  ),
                  // Gender
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Gender'),
                    subtitle: Text(gender),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        _showEditDialog('Gender', gender, (newValue) {
                          setState(() {
                            gender = newValue;
                          });
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 20),
                  // const Text(
                  //   'Other Actions',
                  //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  // ),
                  const SizedBox(height: 10),

                  // Logout Button
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home'); // Implement logout
                    },
                    icon: const Icon(Icons.logout, color: Colors.white),
                    label: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
