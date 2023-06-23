import 'package:flutter/material.dart';

class OutfitTopRow extends StatelessWidget {
  final VoidCallback onDeleteClicked;
  final VoidCallback onAddClicked;
  const OutfitTopRow({
    super.key,
    required this.onDeleteClicked,
    required this.onAddClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Outfits",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
          ),
          Row(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onDeleteClicked,
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 24),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onAddClicked,
                child: const Icon(
                  Icons.add_box_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
