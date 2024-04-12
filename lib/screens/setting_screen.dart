import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      if (_counter == 0) {
        _counter += 0;
      } else {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/pingu.jpg',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ],
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Hi guys! this phone is owned by Pingu'),
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: _increment, icon: const Icon(Icons.thumb_up)),
              IconButton(
                  onPressed: _decrement, icon: const Icon(Icons.thumb_down)),
              Text('${_counter.toString()} likes')
            ],
          )
        ],
      ),
    );
  }
}