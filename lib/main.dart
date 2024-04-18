import 'package:flutter/material.dart';
import 'package:my_app/components/asset_image_rounded.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/screens/news_screen.dart';
import 'package:my_app/screens/recently_screen.dart';
import 'package:my_app/screens/routes/BooksScreen/books_screen.dart';
import 'package:my_app/screens/routes/DatasScreen/datas_screen.dart';
import 'package:my_app/screens/routes/SecondScreen/second_screen.dart';
import 'package:my_app/screens/setting_screen.dart';
import 'package:my_app/screens/profile_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Screen'),
      routes: {
        '/custom-screen': (context) => const RecentlyScreen(),
        '/second-screen': (context) => const SecondScreen(),
        '/new-screen': (context) => const NewsScreen(),
        '/book-screen': (context) => const BooksScreen(),
        '/data-screen':(context) => const DatasScreen(),

      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];

  final List<String> _appBarTitles = const [
    'Home',
    'Settings',
    'Qietify',
  ]; // List of titles corresponding to each screen

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitles[_selectedIndex]),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Pingu'),
              accountEmail: Text('pingu@secret.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: AssetImageRounded(imagePath: 'assets/images/pingu.jpg'),
              ),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 64, 133, 190),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.attach_file),
              title: const Text(
                'Assignment 7: API',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () => Navigator.pushNamed(context, '/new-screen'),
            ),
            ListTile(
              leading: const Icon(Icons.attach_file),
              title: const Text(
                'Add To Liked Songs',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () => Navigator.pushNamed(context, '/book-screen'),
            ),
            ListTile(
              leading: const Icon(Icons.attach_file),
              title: const Text(
                'Data Screen',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () => Navigator.pushNamed(context, '/data-screen'),
            )
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}