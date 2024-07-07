import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabSwapController with ChangeNotifier {
  TabSwapController({
    required List<SwappableTab> tabs,
  }) : _indexedTabs = <int, (int, SwappableTab)>{} {
    for (var i = 0; i < tabs.length; i++) {
      _indexedTabs[i] = (i, tabs[i]);
    }
  }

  final Map<int, (int, SwappableTab)> _indexedTabs;

  int selectedIndex = 0;

  List<SwappableTab> get currentTabConfiguration {
    return _indexedTabs.entries.map((e) => e.value.$2).toList();
  }

  void swapTabs(int tab1Index, int tab2Index) {
    assert(tab1Index >= 0 && tab1Index < _indexedTabs.length);
    assert(tab2Index >= 0 && tab2Index < _indexedTabs.length);

    final tab1 = _indexedTabs[tab1Index]!;
    _indexedTabs[tab1Index] = _indexedTabs[tab2Index]!;
    _indexedTabs[tab2Index] = tab1;
    notifyListeners();
  }
}

class SwappableTab {
  const SwappableTab({required this.tabRoute, required this.builder});

  final BottomNavigationBarItem Function(BuildContext context) builder;
  final StatefulShellBranch tabRoute;
}
