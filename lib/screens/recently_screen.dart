import 'package:flutter/material.dart';

class RecentlyScreen extends StatelessWidget {
  const RecentlyScreen({super.key});

  // Define image assets (replace with your actual image paths)
  static const List<String> imagePaths = [
    'assets/images/DarkWild.jpg',
    'assets/images/FavouriteWorstNightmare.jpg',
    'assets/images/MoodswingsInThisOrder.jpg',
    'assets/images/AnythingYouWant.jpg',
  ];

  // Sample album names (replace with actual data)
  static const List<String> albumNames = [
    'Dark Wild',
    'Favourite Worst Nightmare',
    'Moodswings InThisOrder',
    'Anything You Want',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, // Spotify theme - white background
          title: const Text(
            'Spotify', // App title
            style: TextStyle(color: Colors.black), // White text for title
          ),
          bottom: const TabBar(
            tabs: [
              // Tab icons using Spotify-inspired icons
              Tab(icon: Icon(Icons.library_music_outlined)), // Library
              Tab(icon: Icon(Icons.art_track)), // Recently Played
              Tab(icon: Icon(Icons.album_outlined)), // Just For You
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Display recently played albums with images and titles using ListView.builder
            ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: imagePaths.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                      width: 50.0,
                      height: 50.0, // Adjust image dimensions as needed
                    ),
                  ),
                  title: Text(
                    albumNames[index],
                    style: const TextStyle(fontSize: 14.0), // Adjust font size
                  ),
                );
              },
            ),
            // Placeholders for content on other tabs
            const Center(child: Text('Placeholder for Recently Played')),
            const Center(child: Text('Placeholder for Just For You')),
          ],
        ),
      ),
    );
  }
}
