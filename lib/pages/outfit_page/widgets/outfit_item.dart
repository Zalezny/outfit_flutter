// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:outfit_flutter/custom_widgets/custom_dialog.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

import '../../stopwatch_pager/stopwatch_pager.dart';

class OutfitItem extends StatelessWidget {
  final OutfitDto outfit;
  final bool showBin;
  final Function(String) onRemoveItem;
  const OutfitItem({super.key, required this.outfit, required this.showBin, required this.onRemoveItem});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: outfit.ended ? 0.4 : 1.0,
      child: Card(
        margin: const EdgeInsets.all(12),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/stopwatch-pager',
              arguments: outfit,
            );
          },
          child: Stack(alignment: Alignment.centerRight, children: [
            Center(
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    outfit.title,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  )),
            ),
            showBin
                ? Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (ctx) {
                              return CustomDialog(
                                  onPrimaryButton: () {
                                    onRemoveItem(outfit.sId);
                                    Navigator.of(context).pop();
                                  },
                                  onSecondaryButton: null,
                                  title: "Usuń ${outfit.title}",
                                  description: "Czy napewno chcesz go usunąć?",
                                  primaryButtonText: "TAK",
                                  secondaryButtonText: "NIE");
                            });
                      },
                      child: Icon(
                        Icons.delete_outline,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  )
                : const SizedBox()
          ]),
        ),
      ),
    );
  }
}
