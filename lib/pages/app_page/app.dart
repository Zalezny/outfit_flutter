import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outfit_flutter/models/stopwatch_notification_model.dart';
import 'package:outfit_flutter/pages/outfit_page/outfit_page.dart';
import 'package:outfit_flutter/pages/stopwatch_pager/stopwatch_pager.dart';
import 'package:outfit_flutter/theme/default_theme.dart';

import '../../web_api/dto/outfit_dto.dart';
import 'cubit/notification_cubit.dart';

class App extends StatefulWidget {
  final String? initialRoute;
  final Object? initData;
  const App({super.key, this.initialRoute, this.initData});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static const String name = 'Outfit Katya';

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: App.navigatorKey,
      title: App.name,
      theme: DefaultTheme().buildThemeData(),
      initialRoute: widget.initialRoute ?? '/',
      onGenerateRoute: _generateRoute,
    );
  }

  Route<dynamic>? _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (ctx) => const OutfitPage());
      case '/stopwatch-pager':
        return MaterialPageRoute(
          builder: (ctx) {
            final Object? arguments = widget.initData ?? settings.arguments;

            if (arguments is OutfitDto) {
              return BlocProvider(
                create: (context) => NotificationCubit(),
                child: StopwatchPager(outfit: arguments),
              );
            } else if (arguments is StopwatchNotificationModel) {
              final cubit = NotificationCubit();

              return BlocProvider(
                create: (context) {
                  if (arguments.isFinishStopwatch == true) {
                    return cubit..finishStopwatch(true);
                  }
                  return cubit;
                },
                child: StopwatchPager(outfitId: arguments.outfitId),
              );
            } else {
              assert(false, 'Wrong arguments!');
              return const SizedBox();
            }
          },
        );
      default:
        assert(false, 'Page${settings.name} not found');
        return null;
    }
  }
}
