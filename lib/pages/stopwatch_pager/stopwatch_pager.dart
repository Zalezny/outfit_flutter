import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nested_scroll_views/material.dart';
import 'package:outfit_flutter/pages/stopwatch_page/stopwatch_page.dart';
import 'package:outfit_flutter/pages/work_time_page/bloc/work_time_bloc.dart';
import 'package:outfit_flutter/pages/work_time_page/work_time_page.dart';
import 'package:outfit_flutter/repositories/model_repository.dart';
import 'package:outfit_flutter/utils/custom_physics.dart';
import 'package:outfit_flutter/web_api/connections/outfit_connection.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

import '../outfit_page/bloc/outfit_bloc.dart';
import '../stopwatch_page/widgets/stopwatch_top_row.dart';

class StopwatchPager extends StatefulWidget {
  final OutfitDto? outfit;
  final String? outfitId;
  const StopwatchPager({super.key, this.outfit, this.outfitId});

  @override
  State<StopwatchPager> createState() => _StopwatchPagerState();
}

class _StopwatchPagerState extends State<StopwatchPager> {
  final OutfitBloc outfitBloc = GetIt.I<OutfitBloc>();
  OutfitDto? outfit;

  @override
  void initState() {
    super.initState();
    if (widget.outfit == null) {
      outfitBloc.add(InitOutfitEvent());
    } else {
      outfit = widget.outfit!;
    }
  }

  @override
  Widget build(BuildContext context) {
    
    if (widget.outfit == null) {
      return SafeArea(
        child: Scaffold(
          body: FutureBuilder(
            future: GetIt.I<OutfitConnection>().getOutfits(),
            builder: (ctx, snapshot) {
              if (snapshot.hasData) {
                outfit = snapshot.data!.where((element) => element.sId == widget.outfitId).first;
                return _buildBody();
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      );
    }
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    final PageController controller = PageController();
    return Column(
      children: [
        StopwatchTopRow(
          title: outfit!.title,
          onEndedClick: endedCallback,
        ),
        Expanded(
          child: MultiBlocProvider(
            providers: [
              BlocProvider<MomWorkTimeBloc>(
                  create: ((_) => WorkTimeBloc(GetIt.I<ModelRepository>(), false, outfit!.sId))),
              BlocProvider<KatyaWorkTimeBloc>(
                  create: ((_) => WorkTimeBloc(GetIt.I<ModelRepository>(), true, outfit!.sId))),
            ],
            child: NestedPageView(
              wantKeepAlive: true,
              physics: const ClampingScrollPhysics(parent: CustomPhysics()),
              controller: controller,
              scrollDirection: Axis.vertical,
              children: [
                StopwatchPage(
                  outfit: outfit!,
                ),
                WorkTimePage(
                  outfitId: outfit!.sId,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void endedCallback(BuildContext context) {
    outfitBloc.add(ChangeEndedOutfitEvent(outfit!.sId, !outfit!.ended));
    Navigator.of(context).pop();
  }
}
