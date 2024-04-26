import 'package:flutter/material.dart';

class RecapScreen extends StatelessWidget {
  const RecapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        centerTitle: true, // Center the title text
        title: Text(
          'Your 2024 Wrapped',
          style: TextStyle(color: Colors.white), // Set text color to white
        ),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView( // Enables scrolling for long content
        child: Column(
          children: [
            Stack( // Stack banner with button on top
              children: [
                Image.asset(
                  'assets/images/wrapped.jpg', // Replace with your banner image
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Left align text
                children: [
                  Text(
                    'Top Artists',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Row(
                    // Display top artists with icons 
                    children: [
                      CircleAvatar(
                        radius: 50.0, // Adjust radius for desired size (default is 40.0)
                        backgroundImage: AssetImage('assets/images/BTS.jpg'),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('assets/images/aespa.jpg'),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: AssetImage('assets/images/KissOfLife.jpg'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Top Songs',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Column( // List top songs 
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('1. Fire - BTS'),
                      Text('2. Drama - Aespa'),
                      Text('3. Midas Touch - Kiss Of Life'),
                      Text('4. Mr. Perfectly Fine - Taylor Swift'),
                      Text('5. Could You Love Me While I Hate Myself - Zeph'),
                      Text('6. If You Were Mine - MINOVA'),
                      Text('7. Qonsequences - Camila Cabello'),
                      Text('8. Show Me How - Men I trust'),
                      Text('9. Sweater Weather - The Neighbourhood'),
                      Text('10. Thats Why You Go Away - Michael Learns To Rock'),
                    ],
                  ),
                  // Add more sections for stats and interactive buttons following similar structure
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

