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
    return AlertDialog(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: Text(
        description,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
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
    );
  }
}
