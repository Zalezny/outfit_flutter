import 'package:flutter/material.dart';
import 'package:outfit_flutter/pages/stopwatch_page/widgets/top_row.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              TopRow(),
            ],
          ),
        ),
      ),
    );
  }
}
