import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nested_scroll_views/material.dart';
import 'package:outfit_flutter/pages/work_time_page/bloc/work_time_bloc.dart';
import 'package:outfit_flutter/pages/work_time_page/widgets/work_time_item.dart';
import 'package:outfit_flutter/theme/app_colors.dart';
import 'package:outfit_flutter/utils/total_time_helper.dart';
import 'package:outfit_flutter/web_api/connections/work_time_connection.dart';
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
  late WorkTimeBloc workTimeBloc;
  @override
  void initState() {
    super.initState();
    workTimeBloc = WorkTimeBloc(GetIt.I<WorkTimeConnection>(), widget.isKatyaPage, widget.outfitId);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocProvider(
        create: (context) => workTimeBloc..add(InitWorkTimeEvent(widget.outfitId)),
        child: BlocBuilder<WorkTimeBloc, WorkTimeState>(
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
                          key: ValueKey(state.model[index].sId!),
                          workTime: state.model[index],
                          index: index,
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
              return const Expanded(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  String _totalTimes(List<WorkTime> workTimes) {
    final helper = TotalTimeHelper();
    for (WorkTime work in workTimes) {
      helper.addTotalTime(work.hour!, work.minute!, work.second!);
    }

    return helper.getTime();
  }
}
