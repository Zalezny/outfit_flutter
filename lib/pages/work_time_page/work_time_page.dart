import 'package:flutter/material.dart';
import 'package:outfit_flutter/pages/work_time_page/widgets/work_time_builder.dart';
import 'package:outfit_flutter/web_api/dto/work_time.dart';

class WorkTimePage extends StatelessWidget {
  final List<WorkTime> momHours;
  final List<WorkTime> katyaHours;
  const WorkTimePage({
    super.key,
    required this.momHours,
    required this.katyaHours,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            body: Column(
          children: [
            TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: const Color.fromARGB(255, 255, 0, 0),
                labelColor: Theme.of(context).colorScheme.secondary,
                labelStyle: Theme.of(context).primaryTextTheme.titleLarge,
                tabs: const [
                  Tab(text: 'MAMA'),
                  Tab(text: 'KASIA'),
                ]),
            Expanded(
              child: TabBarView(
                children: [
                  WorkTimeBuilder(workTimes: momHours.reversed.toList()),
                  WorkTimeBuilder(workTimes: katyaHours.reversed.toList()),
                ],
              ),
            ),
          ],
        )));
  }
}
