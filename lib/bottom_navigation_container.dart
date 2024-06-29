import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationContainer extends StatelessWidget {
  const BottomNavigationContainer({
    super.key,
    required this.statefulNavigationShell,
  });

  final StatefulNavigationShell statefulNavigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: statefulNavigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: statefulNavigationShell.currentIndex,
        onTap: (index) {
          statefulNavigationShell.goBranch(index);
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.blue.shade400,
            label: 'tab1',
            icon: const Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.lightGreen.shade400,
            label: 'tab2',
            icon: const Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.yellow.shade800,
            label: 'tab3',
            icon: const Icon(Icons.access_time_filled),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red.shade400,
            label: 'tab4',
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
