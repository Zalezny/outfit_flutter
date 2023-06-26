import 'package:flutter/material.dart';
import 'package:outfit_flutter/pages/work_time_page/widgets/work_time_item.dart';
import 'package:outfit_flutter/theme/app_colors.dart';
import 'package:outfit_flutter/utils/total_time_helper.dart';
import 'package:outfit_flutter/web_api/dto/work_time.dart';

class WorkTimeBuilder extends StatelessWidget {
  final List<WorkTime> workTimes;
  const WorkTimeBuilder({
    super.key,
    required this.workTimes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Data i godzina",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Czas trwania",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: workTimes.length,
              itemBuilder: (context, index) {
                return WorkTimeItem(
                  key: ValueKey(workTimes[index].sId!),
                  workTime: workTimes[index],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'KASIA',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.colorPrimary),
              ),
              Text(
                _totalTimes(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.colorPrimary),
              ),
            ],
          )
        ],
      ),
    );
  }

  String _totalTimes() {
    final helper = TotalTimeHelper();
    for (WorkTime work in workTimes) {
      helper.addTotalTime(work.hour!, work.minute!, work.second!);
    }

    return helper.getTime();
  }
}
