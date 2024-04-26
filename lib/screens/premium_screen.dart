import 'package:flutter/material.dart';
import 'package:my_app/screens/upgrade_screen.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<StatefulWidget> createState() => SettingScreenState();
}

class SettingScreenState extends State<PremiumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed appBar section
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // Your image asset here
              child: Image(
                image: AssetImage('assets/images/premium.jpg'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              '3 months of Premium for\nRp54.990. Step to it.',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Keep your playlists front and center with ad-free music listening.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle successful upgrade logic (optional)
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpgradeSuccessScreen()),
                );
              },
              child: Text(
                'Upgrade to Premium',
                style: TextStyle(color: Colors.white), // Text color changed to white
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo, // Maintain button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
