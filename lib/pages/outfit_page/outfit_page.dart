import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:outfit_flutter/pages/outfit_page/bloc/outfit_bloc.dart';
import 'package:outfit_flutter/pages/outfit_page/widgets/outfit_item.dart';
import 'package:outfit_flutter/pages/outfit_page/widgets/outfit_top_row.dart';
import 'package:outfit_flutter/utils/shared_preference.dart';
import 'package:outfit_flutter/web_api/dto/outfit_dto.dart';

class OutfitPage extends StatefulWidget {
  const OutfitPage({super.key});

  @override
  State<OutfitPage> createState() => _OutfitPageState();
}

class _OutfitPageState extends State<OutfitPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _sharedPref = GetIt.I<SharedPreference>();
  bool _showBin = false;
  final _bloc = GetIt.I<OutfitBloc>();
  List<OutfitDto> _outfits = [];
  final List<String> _userList = ['Kasia', 'Mama'];

  int? _choiceChipValue;

  void _changeShowBin() {
    setState(() {
      _showBin = !_showBin;
    });
  }

  void _onRemoveItem(String id) {
    _bloc.add(DeleteOutfitEvent(id));
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: _scaffoldKey.currentContext!,
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
                _bloc.add(AddOutfitEvent(outfitName));
                Fluttertoast.showToast(msg: 'Dodano nowy outfit');
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      }),
    );
  }

  void _showStarterDialog() {
    _sharedPref.getIsKatya().then((isKatya) {
      if (isKatya != null) {
        _choiceChipValue = isKatya ? 0 : 1;
        setState(() {});
      }
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          "Wybierz swój profil",
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        content: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          spacing: 10.0,
          children: List<Widget>.generate(_userList.length, (index) {
            return ChoiceChip(
                selected: _choiceChipValue == index,
                label: Text(
                  _userList[index],
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
                ),
                onSelected: (selected) {
                  _choiceChipValue = index;
                  _sharedPref.saveIsKatya(_choiceChipValue == 0);
                  Navigator.of(context).pop();
                  setState(() {});
                });
          }).toList(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _sharedPref.getIsKatya().then((isKatya) {
      isKatya == null ? _showStarterDialog() : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          key: _scaffoldKey,
          body: Column(
            children: [
              OutfitTopRow(
                onDeleteClicked: _changeShowBin,
                onAddClicked: _showBottomSheet,
                onProfileClicked: _showStarterDialog,
              ),
              BlocProvider(
                create: (context) => _bloc..add(InitOutfitEvent()),
                child: BlocBuilder<OutfitBloc, OutfitState>(
                  builder: (context, state) {
                    if (state is OutfitSuccessState) {
                      _outfits = state.model;
                      return Expanded(
                        child: RefreshIndicator(
                          displacement: 80.0,
                          onRefresh: () async {
                            _bloc.add(InitOutfitEvent());
                          },
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _outfits.length,
                              itemBuilder: (ctx, index) => OutfitItem(
                                    key: ValueKey(_outfits[index].sId),
                                    outfit: _outfits[index],
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
