import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:swappable_bottom_nav/bottom_navigation_container.dart';

final appRoutes = GoRouter(
  initialLocation: '/first',
  routes: [
    StatefulShellRoute.indexedStack(
      branches: [
        firstTabRoutes,
        secondTabRoutes,
        thirdTabRoutes,
        fourthTabRoutes,
      ],
      builder: (_, __, statefulNavigationShell) {
        return BottomNavigationContainer(
          statefulNavigationShell: statefulNavigationShell,
        );
      },
    ),
  ],
);

final firstTabRoutes = StatefulShellBranch(
  routes: [
    GoRoute(
      path: '/first',
      builder: (_, __) {
        return const Center(
          child: Text('first'),
        );
      },
    )
  ],
);

final secondTabRoutes = StatefulShellBranch(
  routes: [
    GoRoute(
      path: '/second',
      builder: (_, __) {
        return const Center(
          child: Text('second'),
        );
      },
    )
  ],
);

final thirdTabRoutes = StatefulShellBranch(
  routes: [
    GoRoute(
      path: '/third',
      builder: (_, __) {
        return const Center(
          child: Text('third'),
        );
      },
    )
  ],
);

final fourthTabRoutes = StatefulShellBranch(
  routes: [
    GoRoute(
      path: '/fourth',
      builder: (_, __) {
        return const Center(
          child: Text('fourth'),
        );
      },
    )
  ],
);
