import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/main.dart';
import 'package:expence_project/router.dart';
import 'package:expence_project/ui/common/my_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/account_model.dart';
import '../../../logic/account_bloc/account_bloc.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // context.read<AccountBloc>().add(AccountEvent.started());
    super.initState();
  }

  double getAllBalance(List<Account> accountList) {
    double balance = 0;
    for (var data in accountList) {
      data.initialBalance;
      balance += data.initialBalance!;
    }
    return balance;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          print(state);
          return state.map(initial: (initial) {
            return const CircularProgressIndicator();
          }, loading: (loading) {
            return const CircularProgressIndicator();
          }, loaded: (loaded) {
            final listAccount = loaded.listAccount;
            return Column(
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
                            getAllBalance(loaded.listAccount).toString(),
                            style: $styles.text.quote1.copyWith(fontSize: 40),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Column(
                      children: List.generate(
                        loaded.listAccount.length,
                        (index) => ListTiles(
                          height: height,
                          amount: listAccount[index].initialBalance,
                          name: listAccount[index].name,
                        ),
                      ),
                    ),
                    Gap(height * 0.0369),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: MyButton(
                        title: '+ Add new wallet',
                        onPressed: () {
                          appRoute.push(ScreenPaths.addAccount,
                              extra: 'account');
                        },
                      ),
                    )
                  ],
                )
              ],
            );
          }, error: (error) {
            return Text(error.message);
          });
        },
      )),
    );
  }

  Padding appBar(double height) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: height * .0788,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                appRoute.pop();
              },
              icon: const Icon(
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
    this.amount = 400,
    this.name = 'wallet',
  });

  final double height;
  final double? amount;
  final String? name;

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
            const Gap(9),
            Text(
              name!,
              style: $styles.text.bodyBold.copyWith(fontSize: 18),
            ),
            const Spacer(),
            Text(
              '\$ $amount',
              style: $styles.text.bodyBold.copyWith(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
