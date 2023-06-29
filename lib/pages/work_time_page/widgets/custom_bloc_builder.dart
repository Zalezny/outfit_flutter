import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outfit_flutter/pages/work_time_page/bloc/work_time_bloc.dart';

class CustomBlocBuilder extends StatelessWidget {
  final Widget Function(BuildContext, WorkTimeState) builder;
  final bool isKatyaPage;
  const CustomBlocBuilder({super.key, required this.builder, required this.isKatyaPage});

  @override
  Widget build(BuildContext context) {
    return isKatyaPage
        ? BlocBuilder<KatyaWorkTimeBloc, WorkTimeState>(
            bloc: BlocProvider.of<KatyaWorkTimeBloc>(context)..add(InitWorkTimeEvent("ttt")),
            builder: builder,
          )
        : BlocBuilder<MomWorkTimeBloc, WorkTimeState>(
            bloc: BlocProvider.of<MomWorkTimeBloc>(context)..add(InitWorkTimeEvent("ttt")),
            builder: builder,
          );
  }
}
