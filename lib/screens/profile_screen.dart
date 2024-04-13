import 'package:flutter/material.dart';
import 'package:my_app/screens/detail_album.dart';
import 'package:my_app/screens/recently_screen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void goToAnotherRoute(context, screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static const List<String> genres = [
    'Pop',
    'Rock',
    'Hip Hop',
    'Jazz',
    'Country',
    'EDM',
    'R&B',
    'Reggae',
    'Blues',
    'Kpop',
  ];

  static const List<String> artistNames = [
    'BTS',
    'Arctic Monkeys',
    'DPR IAN',
    'Reality Club',
  ];
  // Define image assets 
  static const List<String> imagePaths = [
    'assets/images/DarkWild.jpg',
    'assets/images/FavouriteWorstNightmare.jpg',
    'assets/images/MoodswingsInThisOrder.jpg',
    'assets/images/AnythingYouWant.jpg',
  ];

  // Sample album names 
  static const List<String> albumNames = [
    'Dark Wild',
    'Favourite Worst Nightmare',
    'Moodswings In This Order',
    'Anything You Want'
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white, // Spotify theme 
          bottom: const TabBar(
            tabs: [
              // Tab icons using Spotify-inspired icons
              Tab(icon: Icon(Icons.library_music_outlined)), // Placeholder
              Tab(icon: Icon(Icons.play_circle)), // Recently Played
              Tab(icon: Icon(Icons.album)), // Just For You
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Display four images in two rows with spacing and album names
            ListView(
              // Use ListView for scrollable content if needed
              children: [
                Row(
                  children: List.generate(
                    2, // Generate two items for the first row
                    (index) => Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(
                            8.0), // Add margin between items
                        child: Column(
                          children: [
                            AspectRatio(
                              aspectRatio: 1.0, // Make image square
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Add rounded corners
                                child: Image.asset(
                                  imagePaths[index],
                                  fit: BoxFit.cover, // Fill the container
                                ),
                              ),
                            ),
                            const SizedBox(
                                height:
                                    4.0), // Add space between image and text
                            Text(
                              albumNames[index],
                              textAlign: TextAlign.center, // Center album name
                              style: const TextStyle(
                                  fontSize: 12.0), // Adjust font size and style
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0), // Add space between rows
                Row(
                  children: List.generate(
                    // Ensure we don't exceed image list length
                    imagePaths.length > 2 ? 2 : imagePaths.length,
                    (index) => Expanded(
                      child: GestureDetector(
                        // Wrap the third image with GestureDetector
                        onTap: () {
                          if (imagePaths.length > 2) {
                            // Navigate to detail_album using your goToAnotherRoute function
                            goToAnotherRoute(context, const RecentlyScreen());
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.all(
                              8.0), // Add margin between items
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DetailScreen()));
                                },
                                child: AspectRatio(
                                  aspectRatio:
                                      1.0, // Buat gambar menjadi persegi
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        8.0), // Tambahkan sudut bulat
                                    child: Image.asset(
                                      imagePaths[index +
                                          2], // Gunakan index + 1 untuk gambar ketiga
                                      fit: BoxFit.cover, // Isi kontainer
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  height:
                                      4.0), // Add space between image and text
                              Text(
                                imagePaths.length > 2
                                    ? albumNames[index + 2]
                                    : '', // Access album name only if there are 4 images
                                textAlign:
                                    TextAlign.center, // Center album name
                                style: const TextStyle(
                                    fontSize:
                                        12.0), // Adjust font size and style
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(25, 30, 10, 5),
                ),
                Expanded(
                  child: ListView.builder(
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
                            height:
                                50.0, // Sesuaikan dimensi gambar sesuai kebutuhan
                          ),
                        ),
                        title: Text(
                          albumNames[index],
                          style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight:
                                  FontWeight.bold), // Sesuaikan ukuran font
                        ),
                        subtitle: Text(
                          artistNames[index],
                          style: const TextStyle(
                              fontSize: 14.0, color: Colors.grey),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Jumlah kolom
                childAspectRatio: 2, // Rasio aspek item (lebar/tinggi)
              ),
              itemCount: genres.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      genres[index],
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}