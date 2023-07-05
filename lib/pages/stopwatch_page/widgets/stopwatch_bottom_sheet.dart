import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_picker/picker.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:outfit_flutter/theme/app_colors.dart';
import 'package:outfit_flutter/utils/shared_preference.dart';
import 'package:outfit_flutter/utils/time_utils.dart';
import 'package:outfit_flutter/web_api/dto/work_time.dart';

class StopwatchBottomSheet extends StatefulWidget {
  final Function(WorkTime) onSavePressed;
  const StopwatchBottomSheet({super.key, required this.onSavePressed});

  @override
  State<StopwatchBottomSheet> createState() => _StopwatchBottomSheetState();
}

class _StopwatchBottomSheetState extends State<StopwatchBottomSheet> {
  final SharedPreference sharedPref = GetIt.I<SharedPreference>();
  DateTime _dateTime = DateTime.now();
  Time? _workTime;
  late TextEditingController _dateTextFormController;
  late TextEditingController _timeTextFormController;

  @override
  void initState() {
    super.initState();
    _dateTextFormController = TextEditingController(text: _stringifyDateTime(_dateTime));
    _timeTextFormController = TextEditingController(text: TimeUtils.stringifyTime(_workTime));
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
              onTap: () => _selectWorkTime(context),
            ),
            ElevatedButton(
              onPressed: onSaveData,
              child: const Text('Zapisz do bazy'),
            )
          ],
        ),
      ),
    );
  }

  void onSaveData() async {
    if (_workTime != null) {
      if (_workTime!.hour != 0 || _workTime!.minute != 0 || _workTime!.second != 0) {
        final objWorkTime = WorkTime(
          sId: '',
          hour: _workTime!.hour,
          minute: _workTime!.minute,
          second: _workTime!.second,
          date: DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(_dateTime),
        );
        widget.onSavePressed(objWorkTime);
        Navigator.of(context).pop();
      }
    }
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
    Picker(
        adapter: NumberPickerAdapter(
          data: [
            const NumberPickerColumn(begin: 0, end: 59),
            const NumberPickerColumn(begin: 0, end: 59),
            const NumberPickerColumn(begin: 0, end: 59),
          ],
        ),
        hideHeader: true,
        title: const Text("Wybierz czas trwania"),
        onConfirm: (Picker picker, List<int> value) {
          _workTime = Time(value[0], value[1], value[2]);
          _timeTextFormController.text = TimeUtils.stringifyTime(_workTime);
        }).showDialog(context);
  }
}
