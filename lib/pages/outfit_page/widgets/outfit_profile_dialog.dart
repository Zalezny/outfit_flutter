import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:outfit_flutter/utils/shared_preference.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const pinCode = '4444';

class OutfitProfileDialog extends StatefulWidget {
  final bool isInitPage;
  const OutfitProfileDialog({super.key, required this.isInitPage});

  @override
  State<OutfitProfileDialog> createState() => _OutfitProfileDialogState();
}

class _OutfitProfileDialogState extends State<OutfitProfileDialog> {
  final List<String> _userList = ['Kasia', 'Mama'];
  int? _choiceChipValue;
  final _sharedPref = GetIt.I<SharedPreference>();
  bool _isPinCodePage = true;
  final TextEditingController pinController = TextEditingController();

  @override
  void initState() {
    if (widget.isInitPage) _isPinCodePage = false;
    _sharedPref.getIsKatya().then((isKatya) {
      if (isKatya != null) {
        _choiceChipValue = isKatya ? 0 : 1;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        _isPinCodePage ? 'Wpisz PIN' : "Wybierz swój profil",
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: TextAlign.center,
      ),
      content: _isPinCodePage
          ? PinCodeTextField(
              appContext: context,
              length: 4,
              controller: pinController,
              pinTheme: PinTheme(),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              onChanged: (value) {
                if (value.length == 4) {
                  if (value == pinCode) {
                    _isPinCodePage = false;
                    setState(() {});
                  } else {
                    Fluttertoast.showToast(msg: 'Wrong PIN');
                    pinController.clear();
                  }
                }
              })
          : Wrap(
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
    );
  }
}
