import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/main.dart';
import 'package:expence_project/ui/common/chip_button.dart';
import 'package:expence_project/ui/screens/home/home_screens.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key, this.isShowingMainData = false});

  final bool isShowingMainData;

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String mothly = 'Moth';
  List<String> dateList = ["Year", "Month", "Week"];
  int? filterBy;
  int? sortBy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // padding: const EdgeInsets.symmetric(vertical: 8),
                  width: double.infinity,
                  height: 64,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 96,
                        child: Container(
                          height: 40,
                          width: 96,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: $styles.colors.textWhite),
                              borderRadius: BorderRadius.circular(40)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Expanded(child: Text(mothly)),

                              Expanded(
                                child: DropdownButton(
                                    elevation: 0,
                                    isExpanded: true,
                                    onChanged: (value) {
                                      setState(() {
                                        mothly = value!;
                                      });
                                    },
                                    underline: Container(),
                                    items: dateList
                                        .map<DropdownMenuItem<String>>(
                                            (String e) {
                                      return DropdownMenuItem<String>(
                                          value: e, child: Text(e));
                                    }).toList(),
                                    icon: const Icon(
                                        Icons.keyboard_arrow_down_outlined)),
                              ),
                              // Gap(8),
                              // Gap(8),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        borderRadius: BorderRadius.circular(8),
                        splashColor: $styles.colors.greyMedium,
                        highlightColor: $styles.colors.greyMedium,
                        // hoverColor: $styles.colors.greyMedium,
                        onTap: () {
                          showBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return bottomSheetMenu();
                            },
                          );
                        },
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: $styles.colors.textWhite),
                                borderRadius: BorderRadius.circular(8)),
                            child: const Icon(Icons.filter_list)),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  height: 64,
                  child: Container(
                    padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 16, vertical: 8),
                    height: 48,
                    decoration: BoxDecoration(
                        color: $styles.colors.accent1.withOpacity(.3),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'See your financial report',
                          style: $styles.text.body,
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  height: 48,
                  child: Text(
                    'Today',
                    style: $styles.text.quote2.copyWith(height: 0),
                  ),
                ),
                SizedBox(
                  height: 270,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    children: const <Widget>[
                      ListTileItem(),
                      ListTileItem(),
                      ListTileItem(),
                      ListTileItem()
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  height: 48,
                  child: Text(
                    'Yesterday',
                    style: $styles.text.quote2,
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    children: const <Widget>[
                      ListTileItem(),
                      ListTileItem(),
                      ListTileItem(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  StatefulBuilder bottomSheetMenu() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Container(
        width: double.infinity,
        height: 485,
        decoration: BoxDecoration(
          color: $styles.colors.offWhite,
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(24), right: Radius.circular(24)),
        ),
        child: SeparatedColumn(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          separatorBuilder: () => const Gap(16),
          children: [
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: $styles.colors.greyMedium),
            ),
            // const Spacer(),

            Text(
              'Filter By',
              style: $styles.text.bodyBold,
            ),
            filterByButton(setState),
            Text(
              'Filter By',
              style: $styles.text.bodyBold,
            ),
            sortByButton(),
            Container(
              padding: const EdgeInsets.all(16),
              height: 56,
              child: Row(children: [
                Text(
                  'Choose Category',
                  style: $styles.text.body,
                ),
                // const Spacer(),
              ]),
            )
          ],
        ),
      );
    });
  }

  Column sortByButton() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: RowChipButton(
              label: 'Income',
              isSelected: sortBy == 0,
              onSelected: () {
                setState(() {
                  sortBy = 0;
                });
              },
            )),
            Expanded(
                child: RowChipButton(
              label: 'Income',
              isSelected: sortBy == 0,
              onSelected: () {
                setState(() {
                  sortBy = 0;
                });
              },
            )),
            Expanded(
                child: RowChipButton(
              label: 'Income',
              isSelected: sortBy == 0,
              onSelected: () {
                setState(() {
                  sortBy = 0;
                });
              },
            )),
          ],
        ),
        SizedBox(
          width: 106,
          child: RowChipButton(
            label: 'Income',
            isSelected: sortBy == 0,
            onSelected: () {
              setState(() {
                sortBy = 0;
              });
            },
          ),
        ),
      ],
    );
  }

  Row filterByButton(StateSetter setState) {
    return Row(
      children: [
        Expanded(
            child: RowChipButton(
          label: 'Income',
          isSelected: filterBy == 0,
          onSelected: () {
            setState(() {
              filterBy = 0;
            });
          },
        )),
        Expanded(
            child: RowChipButton(
          label: 'Expense',
          isSelected: filterBy == 1,
          onSelected: () {
            setState(() {
              filterBy = 1;
            });
          },
        )),
        Expanded(
            child: RowChipButton(
          label: 'Transfer',
          isSelected: filterBy == 2,
          onSelected: () {
            setState(() {
              filterBy = 2;
            });
          },
        )),
      ],
    );
  }
}
