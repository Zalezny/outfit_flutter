import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

class OutfitItem extends StatelessWidget {
  final OutfitDto outfit;
  const OutfitItem({super.key, required this.outfit});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(outfit.title!, style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
