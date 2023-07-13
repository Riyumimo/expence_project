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
  bool isRepeat = false;
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
                  hint: 'Category',
                  color: $styles.colors.white,
                  widget: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 32,
                    color: Color(0xFF91919F),
                  ),
                ),
                MyInputField(
                  hint: 'Description',
                  color: $styles.colors.white,
                ),
                MyInputField(
                  hint: 'Wallet',
                  color: $styles.colors.white,
                  widget: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 32,
                    color: Color(0xFF91919F),
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
                            value: isRepeat,
                            onChanged: (value) {
                              setState(() {
                                isRepeat = value;
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
