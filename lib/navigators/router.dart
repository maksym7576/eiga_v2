



import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/landing_screen.dart';
import '../screens/library_screen.dart';
import '../screens/player_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/upload_screen.dart';
import '../screens/vocabulary_screen.dart';

abstract final class AppRoutes {
  static const landing = '/';
  static const home = '/home';
  static const upload = '/upload';
  static const settings = '/settings';
  static const player = '/player';
  static const vocabulary = '/vocabulary';
  static const library = '/library';
}

GoRouter createAppRouter({
  required bool landingCompleted,
}) {
  return GoRouter(
      initialLocation: landingCompleted ? AppRoutes.home : AppRoutes.landing,
    routes: [
      GoRoute(
        path: AppRoutes.landing,
        builder: (context, state) => const LandingScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.upload,
        builder: (context, state) => const UploadScreen(),
      ),
      GoRoute(
        path: AppRoutes.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoutes.player,
        builder: (context, state) => const PlayerScreen(),
      ),
      GoRoute(
        path: AppRoutes.vocabulary,
        builder: (context, state) => const VocabularyScreen(),
      ),
      GoRoute(
        path: AppRoutes.library,
        builder: (context, state) => const LibraryScreen(),
      ),
    ]
  );
}