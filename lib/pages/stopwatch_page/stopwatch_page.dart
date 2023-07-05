import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:outfit_flutter/pages/stopwatch_page/widgets/stopwatch_card.dart';
import 'package:outfit_flutter/pages/work_time_page/bloc/work_time_bloc.dart';
import 'package:outfit_flutter/utils/shared_preference.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';
import 'package:outfit_flutter/web_api/dto/work_time.dart';

import 'bloc/stopwatch_bloc.dart';
import 'widgets/stopwatch_bottom_sheet.dart';

class StopwatchPage extends StatefulWidget {
  final OutfitDto outfit;
  const StopwatchPage({super.key, required this.outfit});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  late StopwatchBloc _stopwatchBloc;
  late Bloc<WorkTimeEvent, WorkTimeState> _workTimeBloc;
  final _sharedPref = GetIt.I<SharedPreference>();
  bool? _isKatya;
  String? _userName;

  @override
  void initState() {
    super.initState();
    _getkatyaInfo();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return _isKatya == null
        ? const SizedBox()
        : Container(
            color: Theme.of(context).primaryColorDark,
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    height: mediaQuery.height * .18,
                    width: double.infinity,
                    color: Theme.of(context).primaryColorDark,
                    child: Center(
                      child: Text(
                        "Dane zapisywane do:\n$_userName",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  BlocProvider(
                    create: (_) => _stopwatchBloc..add(CheckStopwatchEvent()),
                    child: BlocBuilder<StopwatchBloc, StopwatchState>(builder: ((context, state) {
                      if (state is StopwatchRunningState) {
                        return StopwatchCard(
                          onHandAdded: _onHandAdded,
                          outfitName: widget.outfit.title,
                          topText: '${state.timeText}\nCzas trwania',
                          isStopwatchGo: true,
                        );
                      } else if (state is StopwatchFailState) {
                        //todo flutter toast about fail
                      }
                      return StopwatchCard(
                        onHandAdded: _onHandAdded,
                        outfitName: widget.outfit.title,
                        topText: "Dotknij, by uruchomić \nstoper",
                        isStopwatchGo: false,
                      );
                    })),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    height: mediaQuery.height * .18,
                    width: double.infinity,
                    color: Theme.of(context).primaryColorDark,
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text(
                            "Ogólne informacje",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            child: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  Future<void> _getkatyaInfo() async {
    _isKatya = await _sharedPref.getIsKatya();
    _getBlocs();
    _userName = await _sharedPref.getUserName();
    setState(() {});
  }

  void _getBlocs() {
    if (_isKatya != null) {
      _isKatya!
          ? _workTimeBloc = BlocProvider.of<KatyaWorkTimeBloc>(context)
          : _workTimeBloc = BlocProvider.of<MomWorkTimeBloc>(context);
      _stopwatchBloc = StopwatchBloc(FlutterBackgroundService(), _workTimeBloc);
    }
  }

  void _onHandAdded() {
    showModalBottomSheet(
      context: context,
      builder: (context) => StopwatchBottomSheet(
        onSavePressed: _onSavePressed,
      ),
    );
  }

  void _onSavePressed(WorkTime workTime) {
    if (_isKatya != null) {
      final bloc = _isKatya! ? BlocProvider.of<KatyaWorkTimeBloc>(context) : BlocProvider.of<MomWorkTimeBloc>(context);
      bloc.add(AddWorkTimeEvent(workTime));
    }
  }
}
