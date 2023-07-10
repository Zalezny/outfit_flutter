import 'package:flutter/material.dart';

class OutfitTopRow extends StatelessWidget {
  final VoidCallback onDeleteClicked;
  final VoidCallback onAddClicked;
  final VoidCallback onProfileClicked;
  const OutfitTopRow({
    super.key,
    required this.onDeleteClicked,
    required this.onAddClicked,
    required this.onProfileClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).colorScheme.primary,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: onProfileClicked,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Text(
                "Outfits",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: onDeleteClicked,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.delete,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
              ),
              const SizedBox(width: 24),
              InkWell(
                onTap: onAddClicked,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    Icons.add_box_rounded,
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
