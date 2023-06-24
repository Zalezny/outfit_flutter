import 'package:flutter/material.dart';
import 'package:outfit_flutter/pages/stopwatch_page/widgets/stopwatch_top_row.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

class StopwatchPage extends StatelessWidget {
  final OutfitDto outfit;
  const StopwatchPage({super.key, required this.outfit});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              StopwatchTopRow(title: outfit.title!,),
            ],
          ),
        ),
      ),
    );
  }
}
