import 'package:flutter/material.dart';
import 'package:outfit_flutter/theme/app_colors.dart';

class StopwatchBottomSheet extends StatelessWidget {
  const StopwatchBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            TextFormField(
              style: Theme.of(context).textTheme.bodyMedium,
              initialValue: '03/07/2023 21:12',
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
              onTap: () {},
            ),
            const SizedBox(height: 24),
            TextFormField(
              style: Theme.of(context).textTheme.bodyMedium,
              initialValue: '00:00:00',
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
}
