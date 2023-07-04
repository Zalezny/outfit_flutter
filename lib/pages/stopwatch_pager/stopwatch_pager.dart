import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nested_scroll_views/material.dart';
import 'package:outfit_flutter/pages/stopwatch_page/stopwatch_page.dart';
import 'package:outfit_flutter/pages/work_time_page/bloc/work_time_bloc.dart';
import 'package:outfit_flutter/pages/work_time_page/work_time_page.dart';
import 'package:outfit_flutter/utils/custom_physics.dart';
import 'package:outfit_flutter/web_api/connections/work_time_connection.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

import '../outfit_page/bloc/outfit_bloc.dart';
import '../stopwatch_page/widgets/stopwatch_top_row.dart';

class StopwatchPager extends StatelessWidget {
  final OutfitDto outfit;
  const StopwatchPager({super.key, required this.outfit});

  void endedCallback(BuildContext context) {
    final outfitBloc = GetIt.I<OutfitBloc>();
    outfitBloc.add(ChangeEndedOutfitEvent(outfit.sId, !outfit.ended));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            StopwatchTopRow(
              title: outfit.title,
              onEndedClick: endedCallback,
            ),
            Expanded(
              child: MultiBlocProvider(
                providers: [
                  BlocProvider<MomWorkTimeBloc>(create: ((_) => WorkTimeBloc(GetIt.I<WorkTimeConnection>(), false, outfit.sId))),
                  BlocProvider<KatyaWorkTimeBloc>(create: ((_) => WorkTimeBloc(GetIt.I<WorkTimeConnection>(), true, outfit.sId))),
                ],
                child: NestedPageView(
                  wantKeepAlive: true,
                  physics: const ClampingScrollPhysics(parent: CustomPhysics()),
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  children: [
                    StopwatchPage(outfit: outfit),
                    WorkTimePage(
                      outfitId: outfit.sId,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
