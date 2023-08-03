import 'dart:core';

import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/ui/screens/login_screen/login_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../data/models/account_model.dart';
import '../../../data/models/transaction_model.dart';
import '../../../logic/account_bloc/account_bloc.dart';
import '../../common/chip_button.dart';
import '../../common/list_tile_item.dart';
part './widgets/income_expense.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int? _isSelected = 0;
  bool _isLoaded = false;
  List<Color> gradientColors = [
    $styles.colors.accent1,
    $styles.colors.accent2,
  ];
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isLoaded = true;
      });
    });
    // BlocProvider.of<AuthenticationBloc>(context)
    //     .add(AuthenticationEvent.getSignIn(repo.firebaseAuth));
    super.initState();
  }

  @override
  void dispose() {
    _isLoaded;
    super.dispose();
  }

  double _getAllBalance(
      List<Account> accountList, List<TransactionModel>? transactionList) {
    double balance = 0;
    if (transactionList == null) {
      for (var data in accountList) {
        balance += data.initialBalance!;
      }
      return balance;
    } else {
      for (var account in accountList) {
        balance += account.initialBalance ?? 0;
        // print(balance);
        for (var transaction in transactionList) {
          if (account.uid == transaction.accountUid) {
            break;
          }
          String? type = transaction.type?.toLowerCase();
          if (type == 'income') {
            balance += transaction.amount ?? 0;
          } else {
            balance -= transaction.amount ?? 0;
          }
        }
      }
      // print(balance);
      return balance;
    }
  }

  double _getAllTransaction(List<TransactionModel> transactionList,
      {bool isIncome = true}) {
    double amountIncome = 0;
    double amountExpense = 0;
    for (var data in transactionList) {
      if (data.type == 'Income') {
        amountIncome += data.amount!;
      } else {
        amountExpense -= data.amount!;
      }
    }
    return isIncome ? amountIncome : amountExpense;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 64,
              child: SeparatedRow(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  separatorBuilder: () => const Spacer(),
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
                    const MyTextButton(title: 'Oktober'),
                    IconButton(
                        onPressed: () {
                          storage.getUser();
                        },
                        icon: SvgPicture.asset('assets/icons/notifiaction.svg'))
                  ]),
            ),
            Center(
                child: Text(
              'Account Balance',
              style: $styles.text.body
                  .copyWith(height: 0, color: ($styles.colors.textWhite)),
            )),
            const Gap(9),
            getAllBalance(),
            incomeAndExpense(),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SizedBox(
                height: 185,
                child: LineChart(mainData()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
              ),
              child: rowFIlter(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                  height: 56,
                  child: Row(
                    children: [
                      Text(
                        'Recent Transaction',
                        style: $styles.text.quote2.copyWith(fontSize: 18),
                      ),
                      const Spacer(),
                      // ChoiceChip(label: 'label', selected: selected)
                      FilledButton(
                          onPressed: () async {
                            await storage.getAllTransaction();
                          },
                          child: const Text("See all"))
                    ],
                  )),
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: listTransaction(),
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

  BlocBuilder<TransactionBloc, TransactionBlocState> listTransaction() {
    return BlocBuilder<TransactionBloc, TransactionBlocState>(
      builder: (context, state) {
        return state.map(initial: (initial) {
          return const CircularProgressIndicator();
        }, loading: (loading) {
          return const CircularProgressIndicator();
        }, loaded: (loaded) {
          final transactionAccount = loaded.transactionModel;
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: transactionAccount.length,
            itemBuilder: (context, index) {
              final data = transactionAccount[index];
              return ListTileItem(
                amount: data.amount,
                description: data.description,
                createAt: data.createdAt,
                category: data.category,
                type: data.type!.toLowerCase(),
              );
            },
          );
        }, error: (error) {
          return const CircularProgressIndicator();
        });
      },
    );
  }

  BlocBuilder<TransactionBloc, TransactionBlocState> incomeAndExpense() {
    return BlocBuilder<TransactionBloc, TransactionBlocState>(
      builder: (context, state) {
        return state.map(initial: (initial) {
          return const CircularProgressIndicator();
        }, loading: (loading) {
          return const CircularProgressIndicator();
        }, loaded: (loaded) {
          return SeparatedRow(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 23),
            separatorBuilder: () => const Gap(16),
            children: [
              Expanded(
                  child: IncomeExpenseWidget(
                title: 'Income',
                color: const Color(0xFF00A86B),
                amount: _getAllTransaction(loaded.transactionModel).toString(),
                icon: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                      Color(0xFF00A86B), BlendMode.srcIn),
                  child: SvgPicture.asset(
                    'assets/icons/income.svg',
                  ),
                ),
              )),
              Expanded(
                child: IncomeExpenseWidget(
                  title: 'Expense',
                  color: const Color(0xFFFD3C4A),
                  amount: _getAllTransaction(loaded.transactionModel,
                          isIncome: false)
                      .toString(),
                  icon: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                        Color(0xFFFD3C4A), BlendMode.srcIn),
                    child: SvgPicture.asset(
                      'assets/icons/expense.svg',
                    ),
                  ),
                ),
              )
            ],
          );
        }, error: (error) {
          return const CircularProgressIndicator();
        });
      },
    );
  }

  Center getAllBalance() {
    return Center(
      child: BlocBuilder<AccountBloc, AccountState>(
        builder: (context, state) {
          return state.map(initial: (initial) {
            return Text(
              '',
              style: $styles.text.quote1.copyWith(fontSize: 40, height: 0),
            );
          }, loading: (loading) {
            return const CircularProgressIndicator();
          }, loaded: (loaded) {
            List<Account> listAccount = loaded.listAccount;
            return BlocBuilder<TransactionBloc, TransactionBlocState>(
              builder: (context, state) {
                return state.map(initial: (initial) {
                  return const CircularProgressIndicator();
                }, loading: (loading) {
                  return const CircularProgressIndicator();
                }, loaded: (loaded) {
                  return Text(
                    '\$ ${_getAllBalance(listAccount, loaded.transactionModel).toString()}',
                    style:
                        $styles.text.quote1.copyWith(fontSize: 40, height: 0),
                  );
                }, error: (error) {
                  return const CircularProgressIndicator();
                });
              },
            );
          }, error: (error) {
            return Text(
              '',
              style: $styles.text.quote1.copyWith(fontSize: 40, height: 0),
            );
          });
        },
      ),
    );
  }

  SeparatedRow rowFIlter() {
    return SeparatedRow(
      separatorBuilder: () => const Gap(8),
      children: [
        Expanded(
            child: RowChipButton(
          label: 'Today',
          onSelected: () {
            setState(() {
              _isSelected = 0;
            });
          },
          isSelected: _isSelected == 0,
        )),
        Expanded(
            child: RowChipButton(
          label: 'Week',
          isSelected: _isSelected == 1,
          onSelected: () {
            setState(() {
              _isSelected = 1;
            });
          },
        )),
        Expanded(
            child: RowChipButton(
          label: 'Month',
          isSelected: _isSelected == 2,
          onSelected: () {
            setState(() {
              _isSelected = 2;
            });
          },
        )),
        Expanded(
            child: RowChipButton(
          label: 'Year',
          isSelected: _isSelected == 3,
          onSelected: () {
            setState(() {
              _isSelected = 3;
            });
          },
        )),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: false,
        drawHorizontalLine: false,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: $styles.colors.body,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: $styles.colors.body,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: const FlTitlesData(
        show: false,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            // getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
