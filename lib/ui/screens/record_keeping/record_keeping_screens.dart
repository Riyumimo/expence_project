import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/main.dart';
import 'package:expence_project/ui/common/input_field.dart';

part './widgets/attachment_widget.dart';

class RecordKeppingScreen extends StatefulWidget {
  final String? title;
  const RecordKeppingScreen({super.key, this.title});

  @override
  State<RecordKeppingScreen> createState() => _RecordKeppingScreenState();
}

class _RecordKeppingScreenState extends State<RecordKeppingScreen> {
  final TextEditingController _textMoneyController = TextEditingController();
  final TextEditingController _textDescController = TextEditingController();
  bool _isRepeat = false;
  String _hintCategory = 'Category';
  String _hintWallet = 'Wallet';
  List<String> categoryList = ["Food", "Subcriptions", "Shoping", "Monthly"];
  List<String> walletList = ["Bank", "E-Money", "Cash"];
  IconData? categoryIcon(String category) {
    switch (category) {
      case "Food":
        return Icons.food_bank_outlined;
      case "Subcriptions":
        return Icons.table_view_rounded;
      case "Shoping":
        return Icons.shopping_bag_rounded;
      case "Monthly":
        return Icons.calendar_month;
      default:
    }
    return null;
  }

  IconData? walletIcon(String wallet) {
    switch (wallet) {
      case "Bank":
        return Icons.wallet;
      case "E-Money":
        return Icons.paypal;
      case "Cash":
        return Icons.money;
      default:
    }
    return null;
  }

  Color? colorScheme(String title) {
    switch (title) {
      case 'Expense':
        return const Color(0xFFFD3C4A);
      case 'Income':
        return const Color(0xFF00A86B);
      case 'Tranfer':
        return const Color(0xFF0077FF);
      default:
        Colors.amber;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.title) {
      case 'Income':
        break;
      default:
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorScheme(widget.title!) ?? $styles.colors.offWhite,
        centerTitle: true,
        title: Text(widget.title ?? " "),
      ),
      backgroundColor: colorScheme(widget.title!) ?? $styles.colors.offWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Text(
              'How Much?',
              style: $styles.text.body
                  .copyWith(color: $styles.colors.offWhite.withOpacity(.7)),
            ),
          ),
          Gap(13),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Row(
              children: [
                Text(
                  '\$',
                  style: $styles.text.h1.copyWith(color: Colors.white),
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: const TextInputType.numberWithOptions(),
                    style: $styles.text.h1.copyWith(color: Colors.white),
                    controller: _textMoneyController,
                    decoration: InputDecoration(
                        hintText: '0',
                        hintStyle:
                            $styles.text.h1.copyWith(color: Colors.white),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0)),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0))),
                  ),
                ),
              ],
            ),
          ),
          Gap(16),
          Container(
            // height: 395,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(32), topLeft: Radius.circular(32)),
            ),
            child: SeparatedColumn(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              separatorBuilder: () => Gap(12),
              children: [
                MyInputField(
                  hint: _hintCategory,
                  color: $styles.colors.white,
                  widget: DropdownButton(
                    dropdownColor: Colors.white,
                    iconSize: 32,
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        //
                        color: Color(0xFF91919F),
                      ),
                    ),
                    underline: Container(),
                    onChanged: (value) {
                      setState(() {
                        _hintCategory = value!;
                      });
                    },
                    elevation: 4,
                    items: categoryList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Icon(categoryIcon(value),
                                  color: $styles.colors.greyStrong),
                              const Gap(5),
                              Text(
                                value,
                                style: $styles.text.bodyBold
                                    .copyWith(color: $styles.colors.greyStrong),
                              ),
                            ],
                          ));
                    }).toList(),
                  ),
                ),
                MyInputField(
                  textEditingController: _textMoneyController,
                  hint: 'Description',
                  color: $styles.colors.white,
                ),
                MyInputField(
                  hint: _hintWallet,
                  color: $styles.colors.white,
                  widget: DropdownButton(
                    dropdownColor: Colors.white,
                    iconSize: 32,
                    icon: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        //
                        color: Color(0xFF91919F),
                      ),
                    ),
                    underline: Container(),
                    onChanged: (value) {
                      setState(() {
                        _hintWallet = value!;
                      });
                    },
                    elevation: 4,
                    items: walletList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Row(
                            children: [
                              Icon(walletIcon(value),
                                  color: $styles.colors.greyStrong),
                              Gap(5),
                              Text(
                                value,
                                style: $styles.text.bodyBold
                                    .copyWith(color: $styles.colors.greyStrong),
                              ),
                            ],
                          ));
                    }).toList(),
                  ),
                ),
                AttachmentWidget(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 59,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Repeat',
                                style: $styles.text.bodyBold,
                              ),
                              Text(
                                'Repeat transaction',
                                style: $styles.text.bodySmall.copyWith(
                                    height: 0, color: $styles.colors.textWhite),
                              )
                            ],
                          ),
                        ),
                        Switch(
                            value: _isRepeat,
                            onChanged: (value) {
                              setState(() {
                                _isRepeat = value;
                              });
                            }),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('object');
                  },
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: $styles.colors.accent1,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                        child: Text(
                      'Continue',
                      style: $styles.text.bodyBold
                          .copyWith(fontSize: 18, color: Colors.white),
                    )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
