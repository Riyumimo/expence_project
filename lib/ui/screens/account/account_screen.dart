import 'package:expence_project/ui/common/my_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../commons_libs.dart';
import '../../../main.dart';
import '../../common/input_field.dart';
import '../record_keeping_screen/record_keeping_screens.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final TextEditingController _textMoneyController = TextEditingController();
  final TextEditingController _textDescController = TextEditingController();
  String _hintAccountType = 'Account Type';

  List<String> AccountTypeList = ['Bank', 'E-wallet'];

  int? _value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Add new account"),
      ),
      backgroundColor: const Color(0xFF7F3DFF),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Text(
            'Balance?',
            style: $styles.text.body
                .copyWith(color: $styles.colors.offWhite.withOpacity(.7)),
          ),
        ),
        const Gap(13),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Row(
            children: [
              Text(
                '\$',
                style: $styles.text.h1.copyWith(color: Colors.white),
              ),
              Expanded(
                child:
                    RecordInputField(textMoneyController: _textMoneyController),
              ),
            ],
          ),
        ),
        const Gap(16),
        Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32), topLeft: Radius.circular(32)),
            ),
            child: SeparatedColumn(
              separatorBuilder: () => const Gap(12),
              children: [
                MyInputField(
                  colorText:
                      _textDescController.value.text != '' ? true : false,
                  textEditingController: _textDescController,
                  hint: 'Description',
                  color: $styles.colors.white,
                ),
                MyInputField(
                  colorText: _hintAccountType == "Account Type" ? false : true,
                  hint: _hintAccountType,
                  color: $styles.colors.white,
                  widget: DropdownButton(
                      dropdownColor: Colors.white,
                      iconSize: 32,
                      icon: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                          'assets/icons/arrow-down.svg',
                        ),
                      ),
                      underline: Container(),
                      onChanged: (value) {
                        setState(() {
                          _hintAccountType = value!;
                        });
                      },
                      elevation: 4,
                      items: AccountTypeList.map<DropdownMenuItem<String>>(
                          (String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: $styles.text.bodyBold
                                  .copyWith(color: $styles.colors.greyStrong),
                            ));
                      }).toList()),
                ),
                _hintAccountType == "Account Type"
                    ? Container()
                    : Container(
                        height: 88,
                        child: Wrap(
                          spacing: 5.0,
                          children: List<Widget>.generate(
                            3,
                            (int index) => ChoiceChip(
                              label: Text('Index $index'),
                              selected: _value == index,
                              onSelected: (selected) {
                                setState(() {
                                  _value = selected ? index : null;
                                });
                              },
                            ),
                          ).toList(),
                        ),
                      ),
                MyButton(
                  title: 'Continue',
                )
              ],
            ))
      ]),
    );
  }
}
