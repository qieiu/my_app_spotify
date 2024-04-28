import 'package:flutter/material.dart';

class UpgradeSuccessScreen extends StatelessWidget {
  const UpgradeSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upgrade Successful'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.indigo,
              size: 80.0,
            ),
            SizedBox(height: 20),
            Text(
              'Thank you for joining Premium!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Enjoy all the benefits of ad-free music listening.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
