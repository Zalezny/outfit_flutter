import 'package:flutter/material.dart';
import 'package:outfit_flutter/theme/app_colors.dart';

class StopwatchCard extends StatefulWidget {
  const StopwatchCard({super.key});

  @override
  State<StopwatchCard> createState() => _StopwatchCardState();
}

class _StopwatchCardState extends State<StopwatchCard> {
  bool isStopwatchGo = false;

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
            "Dotknij, by uruchomić \nstoper",
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
                setState(() {
                  isStopwatchGo = !isStopwatchGo;
                });
              },
              child: Image.asset(
                isStopwatchGo ? 'assets/images/stoper_rest.png' : 'assets/images/stoper_go.png',
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
