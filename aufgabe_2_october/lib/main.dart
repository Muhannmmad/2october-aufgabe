import 'package:aufgabe_2_october/likes.dart';
import 'package:aufgabe_2_october/news.dart';
import 'package:aufgabe_2_october/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)),
      home: AppHome(),
    );
  }
}

class AppHome extends StatefulWidget {
  @override
  AppHomeState createState() => AppHomeState();
}

class AppHomeState extends State<AppHome> {
  int currentPageIndex = 0;

  final List<Widget> screens = [
    NewsScreen(),
    LikeScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.green,
        selectedIndex: currentPageIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.calendar_today),
            label: 'News',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite),
            label: 'Likes',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
      body: Center(
        child: screens[currentPageIndex],
      ),
    );
  }
}
