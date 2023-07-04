import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outfit_flutter/custom_widgets/custom_dialog.dart';
import 'package:outfit_flutter/pages/stopwatch_page/bloc/stopwatch_bloc.dart';
import 'package:outfit_flutter/pages/stopwatch_page/widgets/stopwatch_bottom_sheet.dart';
import 'package:outfit_flutter/theme/app_colors.dart';

class StopwatchCard extends StatelessWidget {
  final String topText;
  final bool isStopwatchGo;
  final String outfitName;
  final VoidCallback onHandAdded;
  const StopwatchCard(
      {super.key,
      required this.topText,
      required this.isStopwatchGo,
      required this.outfitName,
      required this.onHandAdded});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(28.0),
        width: double.infinity,
        color: Theme.of(context).primaryColorLight.withOpacity(0.1),
        child: Column(children: [
          Text(
            topText,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.red_1867,
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: 30),
          Flexible(
            fit: FlexFit.loose,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                isStopwatchGo
                    ? showDialog(
                        context: context,
                        builder: (ctx) => CustomDialog(
                            onPrimaryButton: () {
                              BlocProvider.of<StopwatchBloc>(context).add(FinishStopwatchEvent());
                              Navigator.of(context).pop();
                            },
                            onSecondaryButton: null,
                            title: 'Czy chcesz zakończyć?',
                            description: 'Twój czas zostanie zapisany do $outfitName',
                            primaryButtonText: 'TAK',
                            secondaryButtonText: 'NIE'))
                    : BlocProvider.of<StopwatchBloc>(context).add(StartStopwatchEvent());
              },
              child: Image.asset(
                isStopwatchGo ? 'assets/images/stoper_go.png' : 'assets/images/stoper_rest.png',
              ),
            ),
          ),
          ElevatedButton(
              onPressed: onHandAdded,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  "DODAJ WPIS RĘCZNY",
                  style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16, fontFamily: 'Roboto'),
                ),
              )),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
