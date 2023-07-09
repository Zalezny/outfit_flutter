import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:outfit_flutter/pages/outfit_page/outfit_page.dart';
import 'package:outfit_flutter/theme/default_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String name = 'Outfit Katya';

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: App.navigatorKey,
      title: App.name,
      theme: DefaultTheme().buildThemeData(),
      initialRoute: '/',
      onGenerateRoute: _generateRoute,
    );
  }

  Route<dynamic>? _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (ctx) => const OutfitPage());
      case '/stopwatch-pager':
        return MaterialPageRoute(builder: (ctx) {
          final ReceivedAction receivedAction = settings.arguments as ReceivedAction;
          print(receivedAction.toMap());
          return const OutfitPage();
          // return StopwatchPager(outfit: outfit);
        });
      default:
        assert(false, 'Page${settings.name} not found');
        return null;
    }
  }
}
