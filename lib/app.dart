import 'package:flutter/material.dart';
import 'package:outfit_flutter/pages/outfit_page/outfit_page.dart';
import 'package:outfit_flutter/theme/default_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Outfit Katya',
      theme: DefaultTheme().buildThemeData(),
      home: const OutfitPage(),
    );
  }
}
