import 'package:flutter/material.dart';

class StopwatchTopRow extends StatelessWidget {
  final String title;
  final Function(BuildContext) onEndedClick;
  const StopwatchTopRow({super.key, required this.title, required this.onEndedClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              onEndedClick(context);
            },
            child: Icon(
              Icons.archive,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ],
      ),
    );
  }
}
