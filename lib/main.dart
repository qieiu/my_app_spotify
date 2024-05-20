import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/components/asset_image_rounded.dart';
import 'package:my_app/cubit/balance_cubit.dart';
import 'package:my_app/cubit/counter_cubit.dart';
import 'package:my_app/screens/routes/SpendingScreen/spending_screen.dart';
import 'package:my_app/screens/WelcomeScreen/welcome_screen.dart';
import 'package:my_app/screens/customerservice_screen.dart';
import 'package:my_app/screens/recap_screen.dart';
import 'package:my_app/screens/news_screen.dart';
import 'package:my_app/screens/recently_screen.dart';
import 'package:my_app/screens/BalanceScreen/balance_screen.dart';
import 'package:my_app/screens/routes/BooksScreen/books_screen.dart';
import 'package:my_app/screens/routes/DatasScreen/datas_screen.dart';
import 'package:my_app/screens/routes/SecondScreen/second_screen.dart';
import 'package:my_app/screens/premium_screen.dart';
import 'package:my_app/screens/album_screen.dart';
import 'package:my_app/screens/CounterScreen/CounterScreen/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  return MultiBlocProvider(
    providers: [
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
        BlocProvider<BalanceCubit>(create: (context) => BalanceCubit())
    ],
    child: MaterialApp(
    title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Home Screen'),
      routes: {
        '/custom-screen': (context) => const RecentlyScreen(),
        '/second-screen': (context) => const SecondScreen(),
        '/new-screen': (context) => const NewsScreen(),
        '/book-screen': (context) => const BooksScreen(),
        '/data-screen':(context) => const DatasScreen(),
        '/cust-screen':(context) => const CustomerServiceScreen(),
        '/recap-screen':(context) => const RecapScreen(),
        '/counter-screen':(context) => const CounterScreen(),
        '/welcome-screen':(context) => const WelcomeScreen(),
        '/balance-screen':(context) => const BalanceScreen(),
        '/spending-screen':(context) => const SpendingScreen()
      },
    ),
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
    RecapScreen(),
    PremiumScreen(),
    AlbumScreen(),
  ];

  final List<String> _appBarTitles = const [
    'Qietify Recap',
    'Qietify Premium',
    'Qietify Album',
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
                color: Colors.indigo,
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
            ),
            ListTile(
              leading: const Icon(Icons.attach_file),
              title: const Text(
                'UTS',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () => Navigator.pushNamed(context, '/cust-screen'),
            ),
             ListTile(
              leading: const Icon(Icons.attach_file),
              title: const Text(
                'Counter Screen',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () => Navigator.pushNamed(context, '/counter-screen'),
            ),
            ListTile(
              leading: const Icon(Icons.attach_file),
              title: const Text(
                'Welcome Screen',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () => Navigator.pushNamed(context, '/welcome-screen'),
            ),
            ListTile(
              leading: const Icon(Icons.attach_file),
              title: const Text(
                'Balance Screen',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () => Navigator.pushNamed(context, '/balance-screen'),
            ),
            ListTile(
              leading: const Icon(Icons.attach_file),
              title: const Text(
                'Spending Screen',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () => Navigator.pushNamed(context, '/spending-screen'),
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cruelty_free),
            label: 'Recap',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num),
            label: 'Premium',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contactless_rounded),
            label: 'Album',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        onTap: _onItemTapped,
      ),
    );
  }
}