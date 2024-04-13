import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

   // Define song data (replace with your actual data)
  static const List<String> songTitles = [
    'So Beautiful',
    'Welcome To The Show',
    'MITO',
    'Nerves',
    'Dope Lovers',
  ];

  static const List<String> imagePaths = [
    'assets/images/MoodswingsInThisOrder.jpg',
    'assets/images/MoodswingsInThisOrder.jpg',
    'assets/images/MoodswingsInThisOrder.jpg',
    'assets/images/MoodswingsInThisOrder.jpg',
    'assets/images/MoodswingsInThisOrder.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Song List'), // You can set a title for the page
      ),
      body: ListView.builder(
        itemCount: songTitles.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 50.0, // Adjust width for image size
              height: 50.0, // Adjust height for image size
              clipBehavior: Clip.antiAlias, // Add rounded corners
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.cover, // Fill the container
              ),
            ),
            title: Text(songTitles[index]), // Display song title
          );
        },
      ),
    );
  }
}
