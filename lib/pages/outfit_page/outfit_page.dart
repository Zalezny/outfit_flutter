import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:outfit_flutter/pages/outfit_page/bloc/outfit_bloc.dart';
import 'package:outfit_flutter/pages/outfit_page/outfit_page_widgets/outfit_item.dart';
import 'package:outfit_flutter/pages/outfit_page/outfit_page_widgets/outfit_top_row.dart';
import 'package:outfit_flutter/web_api/connections/outfit_connection.dart';

class OutfitPage extends StatefulWidget {
  const OutfitPage({super.key});

  @override
  State<OutfitPage> createState() => _OutfitPageState();
}

class _OutfitPageState extends State<OutfitPage> {
  bool _showBin = false;

  void changeShowBin() {
    setState(() {
      _showBin = !_showBin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            OutfitTopRow(
              onIconClicked: changeShowBin,
            ),
            BlocProvider(
                create: (context) => OutfitBloc(
                      GetIt.I<OutfitConnection>(),
                    )..add(SendOutfitEvent()),
                child: BlocBuilder<OutfitBloc, OutfitState>(
                  builder: (context, state) {
                    if (state is OutfitSuccessState) {
                      return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                            itemCount: state.model.outfits!.length,
                            itemBuilder: (ctx, index) => OutfitItem(
                                  outfit: state.model.outfits![index],
                                  showBin: _showBin,
                                )),
                      );
                    } else if (state is OutfitFailState) {
                      return const Text("Failed to reload data");
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
