import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Information',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20.0),
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('assets/images/profile_picture.jpg'),
            ),
            SizedBox(height: 10.0),
            Text(
              'Matlda Brown',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 1.0),
            Text(
              'matldabrown@mail.com',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 10.0),
            Text(
              _generateLoremIpsumText(),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  String _generateLoremIpsumText() {
    return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
        'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
        'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in '
        'reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla '
        'pariatur. Excepteur sint occaecat cupidatat non proident, sunt in '
        'culpa qui officia deserunt mollit anim id est laborum.';
  }
}
