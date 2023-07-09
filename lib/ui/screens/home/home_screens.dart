import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/main.dart';
import 'package:expence_project/ui/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/auth/authentication_bloc.dart';
part './widgets/list_tile_item.dart';
part './widgets/chip_button.dart';
part './widgets/income_expense.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  // @override
  // void initState() {
  //   BlocProvider.of<AuthenticationBloc>(context)
  //       .add(AuthenticationEvent.getSignIn(repo.firebaseAuth));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 64,
              child: SeparatedRow(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  separatorBuilder: () => Spacer(),
                  children: [
                    SizedBox(
                        height: 32,
                        width: 32,
                        child: CircleAvatar(
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          child: Image.asset(
                            'assets/images/splash.png',
                            fit: BoxFit.contain,
                          ),
                        )),
                    MyTextButton(title: 'Oktober'),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.notifications))
                  ]),
            ),
            Center(
                child: Text(
              'Account Balance',
              style: $styles.text.quote2Sub
                  .copyWith(color: ($styles.colors.textWhite)),
            )),
            Center(
              child: SizedBox(
                height: 44,
                width: 328,
                child: Center(
                  child: Text(
                    '\$9400',
                    style: $styles.text.quote1,
                  ),
                ),
              ),
            ),
            SeparatedRow(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
              separatorBuilder: () => const Gap(16),
              children: [
                Expanded(child: IncomeExpenseWidget()),
                Expanded(child: IncomeExpenseWidget())
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 48,
                child: Text(
                  'Spend Frequency',
                  style: $styles.text.quote2,
                ),
              ),
            ),
            SizedBox(
              height: 185,
              child: Image.asset('assets/images/Graph.png'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: Row(
                children: [
                  Expanded(child: RowChipDates()),
                  Expanded(child: RowChipDates()),
                  Expanded(child: RowChipDates()),
                  Expanded(child: RowChipDates()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                  height: 56,
                  child: Row(
                    children: [
                      Text(
                        'Recent Transaction',
                        style: $styles.text.quote2,
                      ),
                      const Spacer(),
                      const Expanded(child: RowChipDates())
                    ],
                  )),
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 27,
                ),
                children: [
                  ListTileItem(),
                  ListTileItem(),
                  ListTileItem(),
                ],
              ),
            ),
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       context
            //           .read<AuthenticationBloc>()
            //           .add(const AuthenticationEvent.signOut());
            //     },
            //     child: const Text("test"),
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }
}
