import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outfit_flutter/pages/stopwatch_page/bloc/stopwatch_bloc.dart';
import 'package:outfit_flutter/theme/app_colors.dart';

class StopwatchCard extends StatelessWidget {
  final String topText;
  final bool isStopwatchGo;
  const StopwatchCard({
    super.key,
    required this.topText,
    required this.isStopwatchGo,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
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
                BlocProvider.of<StopwatchBloc>(context)
                    .add(isStopwatchGo ? FinishStopwatchEvent() : StartStopwatchEvent());
              },
              child: Image.asset(
                isStopwatchGo ? 'assets/images/stoper_go.png' : 'assets/images/stoper_rest.png',
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {},
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
