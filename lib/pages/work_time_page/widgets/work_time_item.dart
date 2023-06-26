import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:outfit_flutter/web_api/dto/work_time.dart';

class WorkTimeItem extends StatelessWidget {
  final WorkTime workTime;
  const WorkTimeItem({super.key, required this.workTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatJsonDate(workTime.date!),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                _generateTimeText(workTime),
              ),
            ],
          ),
          const Divider(thickness: 1.0)
        ],
      ),
    );
  }

  String _formatJsonDate(String jsonDate) {
    DateTime date = DateTime.parse(jsonDate);
    DateTime now = DateTime.now();

    // Sprawdź, czy data jest dzisiejsza
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      // Jeśli tak, sformatuj jako "Dziś, HH:mm:ss"
      DateFormat formatter = DateFormat.Hms('pl_PL');
      String formattedTime = formatter.format(date);
      return 'Dziś, $formattedTime';
    } else {
      // Jeśli nie, sformatuj jako "dd.MM.yyyy, HH:mm:ss"
      DateFormat formatter = DateFormat('dd.MM.yyyy, HH:mm:ss');
      return formatter.format(date);
    }
  }

  String _generateTimeText(WorkTime wt) {
    return '${wt.hour}:${wt.minute}:${wt.second}';
  }
}
