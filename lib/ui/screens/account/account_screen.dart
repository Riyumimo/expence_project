import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/main.dart';
import 'package:expence_project/router.dart';
import 'package:expence_project/ui/common/my_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          appBar(height),
          SizedBox(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/images/BG.png'),
                Column(
                  children: [
                    Text(
                      'Account Balance',
                      style: $styles.text.body,
                    ),
                    Text(
                      '\$8000',
                      style: $styles.text.quote1.copyWith(fontSize: 40),
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              ListTiles(height: height),
              ListTiles(height: height),
              ListTiles(height: height),
              ListTiles(height: height),
              Gap(height * 0.0369),
              Padding(
                padding: const EdgeInsets.all(16),
                child: MyButton(
                  title: '+ Add new wallet',
                  onPressed: () {
                    appRoute.push(ScreenPaths.addAccount);
                  },
                ),
              )
            ],
          )
        ],
      )),
    );
  }

  Padding appBar(double height) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: height * .0788,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                appRoute.pop();
              },
              icon: Icon(
                Icons.arrow_back,
                size: 32,
              ),
            ),
            // Spacer(),
            Expanded(
              child: Center(
                child: Text(
                  'Account',
                  style: $styles.text.bodyBold.copyWith(fontSize: 18),
                ),
              ),
            ),
            // Spacer(),
            IconButton(
              onPressed: () {},
              icon: Container(
                width: 32,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ListTiles extends StatelessWidget {
  const ListTiles({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * .0985,
      // color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Container(
              // padding: EdgeInsets.all(10),
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  color: const Color(0xFFEEE5FF),
                  borderRadius: BorderRadius.circular(16)),
              child: const Icon(
                Icons.wallet,
                size: 32,
              ),
            ),
            Gap(9),
            Text(
              'Wallet',
              style: $styles.text.bodyBold.copyWith(fontSize: 18),
            ),
            Spacer(),
            Text(
              '\$400',
              style: $styles.text.bodyBold.copyWith(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
