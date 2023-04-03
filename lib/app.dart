
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:outfit_flutter/pages/outfit_page/outfit_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Outfit Katya',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OutfitPage(),
    );
  }
}