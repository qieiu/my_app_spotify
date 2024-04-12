import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'), // Customize app bar title
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(), // Access drawer using Scaffold.of(context)
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'User Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Navigate to home screen
                Navigator.pop(context); // Close the drawer
                // Your navigation code for home screen
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Navigate to settings screen
                Navigator.pop(context); // Close the drawer
                // Your navigation code for settings screen
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('This is the main content of your profile'), // Customize profile content
      ),
    );
  }
}
