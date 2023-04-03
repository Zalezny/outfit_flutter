import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:outfit_flutter/pages/outfit_page/bloc/outfit_bloc.dart';
import 'package:outfit_flutter/pages/outfit_page/outfit_page_widgets/outfit_item.dart';
import 'package:outfit_flutter/web_api/connections/outfit_connection.dart';

class OutfitPage extends StatelessWidget {
  const OutfitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Outfits")),
      body: BlocProvider(
          create: (context) => OutfitBloc(
                GetIt.I<OutfitConnection>(),
              )..add(SendOutfitEvent()),
          child: BlocBuilder<OutfitBloc, OutfitState>(
            builder: (context, state) {
              if (state is OutfitSuccessState) {
                return ListView.builder(
                  reverse: true,
                    itemCount: state.model.outfits!.length,
                    itemBuilder: (ctx, index) =>
                        OutfitItem(outfit: state.model.outfits![index]));
              } else if (state is OutfitFailState) {
                return const Text("Failed to reload data");
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
