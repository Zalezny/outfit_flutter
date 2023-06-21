import 'package:flutter/material.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

class OutfitItem extends StatelessWidget {
  final OutfitDto outfit;
  const OutfitItem({super.key, required this.outfit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      child: Center(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              outfit.title!,
              style: Theme.of(context).textTheme.titleLarge,
            )),
      ),
    );
  }
}
