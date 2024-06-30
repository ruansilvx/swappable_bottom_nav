import 'package:flutter/material.dart';
import 'package:swappable_bottom_nav/app_routes.dart';
import 'package:swappable_bottom_nav/tab_swap_controller.dart';
import 'package:swappable_bottom_nav/tab_swap_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TabSwapProvider(
      tabSwapController: TabSwapController(
        tabs: [
          SwappableTab(
            tabRoute: firstTabRoutes,
            builder: (_) {
              return BottomNavigationBarItem(
                backgroundColor: Colors.blue.shade400,
                label: 'tab1',
                icon: const Icon(Icons.home),
              );
            },
          ),
          SwappableTab(
            tabRoute: secondTabRoutes,
            builder: (_) {
              return BottomNavigationBarItem(
                backgroundColor: Colors.lightGreen.shade400,
                label: 'tab2',
                icon: const Icon(Icons.book),
              );
            },
          ),
          SwappableTab(
            tabRoute: thirdTabRoutes,
            builder: (_) {
              return BottomNavigationBarItem(
                backgroundColor: Colors.yellow.shade800,
                label: 'tab3',
                icon: const Icon(Icons.access_time_filled),
              );
            },
          ),
          SwappableTab(
            tabRoute: fourthTabRoutes,
            builder: (_) {
              return BottomNavigationBarItem(
                backgroundColor: Colors.red.shade400,
                label: 'tab4',
                icon: const Icon(Icons.settings),
              );
            },
          ),
        ],
      ),
      child: Builder(
        builder: (context) {
          return ListenableBuilder(
            listenable: context.tabController,
            builder: (context, _) {
              return MaterialApp.router(
                routerConfig: appRoutes(
                  branches: context.tabController.currentTabConfiguration
                      .map((e) => e.tabRoute)
                      .toList(),
                ),
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
                ),
              );
            },
          );
        }
      ),
    );
  }
}
