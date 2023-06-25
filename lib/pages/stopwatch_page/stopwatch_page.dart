import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:outfit_flutter/pages/stopwatch_page/widgets/stopwatch_card.dart';
import 'package:outfit_flutter/pages/stopwatch_page/widgets/stopwatch_top_row.dart';
import 'package:outfit_flutter/utils/shared_preference.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

class StopwatchPage extends StatefulWidget {
  final OutfitDto outfit;
  const StopwatchPage({super.key, required this.outfit});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  final sharedPref = GetIt.I<SharedPreference>();
  bool? isKatya;

  @override
  void initState() {
    super.initState();
    _getIsKatya();
  }

  Future<void> _getIsKatya() async {
    isKatya = await sharedPref.getIsKatya();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return isKatya == null
        ? const SizedBox()
        : Container(
            color: Theme.of(context).primaryColorDark,
            child: SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    StopwatchTopRow(title: widget.outfit.title!),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      height: mediaQuery.height * .18,
                      width: double.infinity,
                      color: Theme.of(context).primaryColorDark,
                      child: Center(
                        child: Text(
                          "Dane zapisywane do:\nKATYA",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    const StopwatchCard(),
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
            ),
          );
  }
}
