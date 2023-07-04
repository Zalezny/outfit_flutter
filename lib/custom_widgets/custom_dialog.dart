import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final VoidCallback onPrimaryButton;
  final VoidCallback? onSecondaryButton;
  final String title;
  final String description;
  final String primaryButtonText;
  final String secondaryButtonText;

  const CustomDialog({
    super.key,
    required this.onPrimaryButton,
    required this.onSecondaryButton,
    required this.title,
    required this.description,
    required this.primaryButtonText,
    required this.secondaryButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        padding: const EdgeInsets.only(
          top: 24,
          left: 24,
          right: 8,
          bottom: 4,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: onSecondaryButton ??
                          () {
                            Navigator.of(context).pop();
                          },
                      child: Text(secondaryButtonText),
                    ),
                    TextButton(
                      onPressed: onPrimaryButton,
                      child: Text(primaryButtonText),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
