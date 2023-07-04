import 'package:flutter/material.dart';
import 'package:nested_scroll_views/material.dart';
import 'package:outfit_flutter/pages/work_time_page/bloc/work_time_bloc.dart';
import 'package:outfit_flutter/pages/work_time_page/widgets/custom_bloc_builder.dart';
import 'package:outfit_flutter/pages/work_time_page/widgets/work_time_item.dart';
import 'package:outfit_flutter/theme/app_colors.dart';
import 'package:outfit_flutter/utils/total_time_helper.dart';
import 'package:outfit_flutter/web_api/dto/work_time.dart';

class WorkTimeBuilder extends StatefulWidget {
  final String outfitId;
  final bool isKatyaPage;
  const WorkTimeBuilder({
    super.key,
    required this.outfitId,
    required this.isKatyaPage,
  });

  @override
  State<WorkTimeBuilder> createState() => _WorkTimeBuilderState();
}

class _WorkTimeBuilderState extends State<WorkTimeBuilder> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomBlocBuilder(
        isKatyaPage: widget.isKatyaPage,
        builder: (context, state) {
          if (state is WorkTimeSuccessState) {
            return Column(
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
                  child: NestedListView.builder(
                    itemCount: state.model.length,
                    itemBuilder: (context, index) {
                      return WorkTimeItem(
                        key: ValueKey(state.model[index].sId),
                        workTime: state.model[index],
                        index: index,
                        isKatyaPage: widget.isKatyaPage,
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
                      _totalTimes(state.model),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.colorPrimary),
                    ),
                  ],
                )
              ],
            );
          } else if (state is WorkTimeFailState) {
            return const Text('Failed to reload data');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  String _totalTimes(List<WorkTime> workTimes) {
    final helper = TotalTimeHelper();
    for (WorkTime work in workTimes) {
      helper.addTotalTime(work.hour, work.minute, work.second);
    }

    return helper.getTime();
  }
}
