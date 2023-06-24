import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:outfit_flutter/pages/outfit_page/bloc/outfit_bloc.dart';
import 'package:outfit_flutter/pages/outfit_page/outfit_page_widgets/outfit_item.dart';
import 'package:outfit_flutter/pages/outfit_page/outfit_page_widgets/outfit_top_row.dart';
import 'package:outfit_flutter/web_api/connections/outfit_connection.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

class OutfitPage extends StatefulWidget {
  const OutfitPage({super.key});

  @override
  State<OutfitPage> createState() => _OutfitPageState();
}

class _OutfitPageState extends State<OutfitPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final OutfitConnection outfitConnection = GetIt.I<OutfitConnection>();
  bool _showBin = false;
  final bloc = OutfitBloc(GetIt.I<OutfitConnection>());
  List<OutfitDto> outfits = [];

  void _changeShowBin() {
    setState(() {
      _showBin = !_showBin;
    });
  }

  void _onRemoveItem(String id) {
    final index = outfits.indexWhere((element) => element.sId == id);
    outfits.removeAt(index);
    setState(() {});
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: scaffoldKey.currentContext!,
      builder: ((context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              maxLength: 18,
              decoration: const InputDecoration(
                labelText: "Set outfit name",
                labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                border: OutlineInputBorder(),
              ),
              onFieldSubmitted: (outfitName) {
                outfitConnection.postOutfit(outfitName);
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      }),
    ).whenComplete(() => bloc.add(SendOutfitEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        key: scaffoldKey,
        body: Column(
          children: [
            OutfitTopRow(
              onDeleteClicked: _changeShowBin,
              onAddClicked: _showBottomSheet,
            ),
            BlocProvider(
                create: (context) => bloc..add(SendOutfitEvent()),
                child: BlocBuilder<OutfitBloc, OutfitState>(
                  builder: (context, state) {
                    if (state is OutfitSuccessState) {
                      outfits = state.model.outfits!.reversed.toList();
                      return Expanded(
                        child: RefreshIndicator(
                          displacement: 80.0,
                          onRefresh: () async {
                            bloc.add(SendOutfitEvent());
                          },
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: outfits.length,
                              itemBuilder: (ctx, index) => OutfitItem(
                                    key: ValueKey(outfits[index].sId),
                                    outfit: outfits[index],
                                    showBin: _showBin,
                                    onRemoveItem: _onRemoveItem,
                                  )),
                        ),
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
