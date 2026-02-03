import 'package:flutter/material.dart';
import 'package:movtest3/views/director_view.dart';
import 'package:movtest3/views/number_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _views = const [
    DirectorView(),
    NumberView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _views[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Director',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.numbers),
            label: 'Numeros',
          ),
        ],
      ),
    );
  }
}