import 'package:expence_project/router.dart';
import 'package:expence_project/ui/common/my_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../commons_libs.dart';
import '../../../logic/account_bloc/account_bloc.dart';
import '../../../main.dart';
import '../../common/input_field.dart';
import '../record_keeping_screen/record_keeping_screens.dart';

class AddAccountScreens extends StatefulWidget {
  const AddAccountScreens({super.key, this.title = 'login'});
  final String? title;
  @override
  State<AddAccountScreens> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AddAccountScreens> {
  final TextEditingController _textMoneyController = TextEditingController();
  final TextEditingController _textDescController = TextEditingController();
  String _hintAccountType = 'Account Type';
  List<String> AccountTypeList = ['Bank', 'E-wallet'];
  int? _value = 0;

  Widget? switchWidget(int i) {
    switch (i) {
      case 0:
        return const Icon(
          Icons.bar_chart_rounded,
        );
      case 1:
        return const Icon(Icons.balance);
      case 2:
        return const Icon(Icons.margin);
      case 3:
        return const Icon(Icons.add_chart);
      case 4:
        return const Icon(Icons.bar_chart);
      default:
    }
    return null;
  }

  String? accountName(int i) {
    switch (i) {
      case 0:
        return "BNI";
      case 1:
        return "Paypal";
      case 2:
        return "Sryariah";
      case 3:
        return "BRI";
      case 4:
        return "Mandiri";
      default:
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text("Add new account"),
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
              padding: const EdgeInsets.all(16),
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
                        padding: const EdgeInsets.only(right: 8.0),
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
                    : SizedBox(
                        height: 88,
                        width: double.infinity,
                        child: Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          spacing: 6.0,
                          children: List<Widget>.generate(
                            5,
                            (int index) => ChoiceChip(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              // labelStyle: const TextStyle(fontSize: 24),
                              elevation: 0,
                              pressElevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              selectedColor: const Color(0xFFEEE5FF),
                              backgroundColor: const Color(0xFFF1F1FA),
                              label: switchWidget(index)!,
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
                  onPressed: () {
                    final accountNaming = accountName(_value!);
                    int? intValue = int.tryParse(_textMoneyController.text);
                    if (widget.title == 'login') {
                      context.read<AccountBloc>().add(AccountEvent.add(
                          _hintAccountType,
                          accountNaming!,
                          _textDescController.text,
                          intValue ?? 0));

                      appRoute.go(ScreenPaths.dashboard);
                    } else {
                      print('pop...');
                      context.read<AccountBloc>().add(AccountEvent.add(
                          _hintAccountType,
                          accountNaming!,
                          _textDescController.text,
                          intValue ?? 0));
                      context
                          .read<AccountBloc>()
                          .add(const AccountEvent.started());
                      Future.delayed(const Duration(milliseconds: 100), () {
                        appRoute.pop();
                      });
                    }
                  },
                )
              ],
            ))
      ]),
    );
  }
}
