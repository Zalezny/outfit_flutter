import 'package:flutter/material.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

class OutfitItem extends StatelessWidget {
  final OutfitDto outfit;
  final bool showBin;
  const OutfitItem({
    super.key,
    required this.outfit,
    required this.showBin,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: outfit.ended! ? 0.4 : 1.0,
      child: Card(
        margin: const EdgeInsets.all(12),
        child: Stack(alignment: Alignment.centerRight, children: [
          Center(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  outfit.title!,
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
                            return AlertDialog(
                              title: Text(
                                "Usuń ${outfit.title}",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              content: Text(
                                "Czy napewno chcesz go usunąć?",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("NIE"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    //TODO: remove this item in database and local
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("TAK"),
                                )
                              ],
                            );
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
    );
  }
}
