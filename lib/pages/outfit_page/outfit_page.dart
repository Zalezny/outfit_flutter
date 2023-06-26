import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:outfit_flutter/pages/outfit_page/bloc/outfit_bloc.dart';
import 'package:outfit_flutter/pages/outfit_page/widgets/outfit_item.dart';
import 'package:outfit_flutter/pages/outfit_page/widgets/outfit_top_row.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

class OutfitPage extends StatefulWidget {
  const OutfitPage({super.key});

  @override
  State<OutfitPage> createState() => _OutfitPageState();
}

class _OutfitPageState extends State<OutfitPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showBin = false;
  final bloc = GetIt.I<OutfitBloc>();
  List<OutfitDto> outfits = [];

  void _changeShowBin() {
    setState(() {
      _showBin = !_showBin;
    });
  }

  void _onRemoveItem(String id) {
    bloc.add(DeleteOutfitEvent(id));
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
                bloc.add(AddOutfitEvent(OutfitDto(title: outfitName)));
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
      child: SafeArea(
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
                create: (context) => bloc..add(InitOutfitEvent()),
                child: BlocBuilder<OutfitBloc, OutfitState>(
                  builder: (context, state) {
                    if (state is OutfitSuccessState) {
                      outfits = state.model;
                      return Expanded(
                        child: RefreshIndicator(
                          displacement: 80.0,
                          onRefresh: () async {
                            bloc.add(InitOutfitEvent());
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
                      return const Expanded(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
