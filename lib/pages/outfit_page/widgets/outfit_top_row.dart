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
      // color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Outfits",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Row(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onDeleteClicked,
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              const SizedBox(width: 24),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: onAddClicked,
                child: Icon(
                  Icons.add_box_rounded,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
