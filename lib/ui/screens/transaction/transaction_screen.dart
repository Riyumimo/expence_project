import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/main.dart';
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
                                    icon: Icon(
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
                            context: context,
                            builder: (context) {
                              return const SizedBox(
                                width: double.infinity,
                                height: 200,
                                child: Text('Data'),
                              );
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
                  padding: EdgeInsets.symmetric(vertical: 8),
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
                    padding: EdgeInsets.symmetric(horizontal: 8),
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
}
