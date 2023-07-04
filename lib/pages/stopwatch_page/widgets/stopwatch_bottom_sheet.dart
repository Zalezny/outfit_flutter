import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:outfit_flutter/theme/app_colors.dart';

class StopwatchBottomSheet extends StatefulWidget {
  const StopwatchBottomSheet({super.key});

  @override
  State<StopwatchBottomSheet> createState() => _StopwatchBottomSheetState();
}

class _StopwatchBottomSheetState extends State<StopwatchBottomSheet> {
  DateTime? _dateTime;
  Time? _workTime;
  late TextEditingController _dateTextFormController;
  late TextEditingController _timeTextFormController;

  @override
  void initState() {
    super.initState();
    _dateTextFormController = TextEditingController(text: _stringifyDateTime(_dateTime));
    _timeTextFormController = TextEditingController(text: '00:00:00');
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            TextFormField(
              controller: _dateTextFormController,
              style: Theme.of(context).textTheme.bodyMedium,
              readOnly: true,
              decoration: InputDecoration(
                  label: Text(
                    'Data i godzina rozpoczęcia',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red_1867), // Kolor ramki, gdy pole jest wyłączone
                  ),
                  border: const OutlineInputBorder()),
              onTap: () => _selectDateTime(context),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _timeTextFormController,
              style: Theme.of(context).textTheme.bodyMedium,
              readOnly: true,
              decoration: InputDecoration(
                  label: Text(
                    'Czas trwania',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.red_1867), // Kolor ramki, gdy pole jest wyłączone
                  ),
                  border: const OutlineInputBorder()),
              onTap: () {},
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Zapisz do bazy'),
            )
          ],
        ),
      ),
    );
  }

  void _selectDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        final dateTime = pickedDate.add(Duration(hours: pickedTime.hour, minutes: pickedTime.minute));
        _dateTime = dateTime;
        _dateTextFormController.text = _stringifyDateTime(_dateTime);
        setState(() {});
      }
    }
  }

  String _stringifyDateTime(DateTime? dateTime) {
    return DateFormat('dd/MM/yyyy HH:mm').format(dateTime ?? DateTime.now());
  }

  void _selectWorkTime(BuildContext context) {

  }
}
