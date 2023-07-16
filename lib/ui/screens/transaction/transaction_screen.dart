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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 64,
              child: Expanded(
                child: Row(
                  children: [
                    DropdownButton(
                      onChanged: (value) {
                        setState(() {
                          mothly = value!;
                        });
                      },
                      items: dateList.map<DropdownMenuItem<String>>((e) {
                        return DropdownMenuItem(child: Text(e));
                      }).toList(),
                      icon: Container(
                        height: 40,
                        width: 96,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: $styles.colors.offWhite),
                            borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          children: <Widget>[
                            const Icon(Icons.keyboard_arrow_down_outlined),
                            Text(mothly)
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: $styles.colors.offWhite),
                          borderRadius: BorderRadius.circular(8)),
                      child: IconButton(
                          onPressed: () {
                            showBottomSheet(
                              context: context,
                              builder: (context) {
                                return const SizedBox(
                                  height: 200,
                                  child: Text('data'),
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.filter_list)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 64,
              child: Container(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
                height: 48,
                decoration: BoxDecoration(
                    color: $styles.colors.accent1.withOpacity(.3),
                    borderRadius: BorderRadius.circular(8)),
                child: Expanded(
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
            ),
            Container(
              height: 48,
              child: Text(
                'Today',
                style: $styles.text.quote2,
              ),
            ),
            SizedBox(
              height: 270,
              child: ListView(
                children: const <Widget>[
                  ListTileItem(),
                  ListTileItem(),
                  ListTileItem()
                ],
              ),
            ),
            SizedBox(
              height: 48,
              child: Text(
                'Yesterday',
                style: $styles.text.quote2,
              ),
            ),
            Expanded(
              child: SizedBox(
                child: ListView(
                  children: const <Widget>[
                    ListTileItem(),
                    ListTileItem(),
                    ListTileItem(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
