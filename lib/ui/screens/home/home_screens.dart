import 'dart:core';

import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/main.dart';
import 'package:expence_project/ui/screens/login_screen/login_screen.dart';
import 'package:fl_chart/fl_chart.dart';
part './widgets/list_tile_item.dart';
part './widgets/chip_button.dart';
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

  @override
  Widget build(BuildContext context) {
    print(_isSelected);
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
                Expanded(
                    child: IncomeExpenseWidget(
                  title: 'Income',
                  color: $styles.colors.accent1,
                  amount: '\$5000',
                  icon: const Icon(Icons.trending_up),
                )),
                Expanded(
                  child: IncomeExpenseWidget(
                      title: 'Expense',
                      color: Colors.red[800],
                      amount: '\$5000',
                      icon: const Icon(Icons.trending_down)),
                )
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
              child: Row(
                children: [
                  Expanded(
                      child: RowChipDates(
                    label: 'Today',
                    onSelected: () {
                      setState(() {
                        _isSelected = 0;
                      });
                    },
                    isSelected: _isSelected == 0,
                  )),
                  Expanded(
                      child: RowChipDates(
                    label: 'Week',
                    isSelected: _isSelected == 1,
                    onSelected: () {
                      setState(() {
                        _isSelected = 1;
                      });
                    },
                  )),
                  Expanded(
                      child: RowChipDates(
                    label: 'Month',
                    isSelected: _isSelected == 2,
                    onSelected: () {
                      setState(() {
                        _isSelected = 2;
                      });
                    },
                  )),
                  Expanded(
                      child: RowChipDates(
                    label: 'Year',
                    isSelected: _isSelected == 3,
                    onSelected: () {
                      setState(() {
                        _isSelected = 3;
                      });
                    },
                  )),
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
                        style: $styles.text.quote2.copyWith(fontSize: 18),
                      ),
                      const Spacer(),
                      // ChoiceChip(label: 'label', selected: selected)
                      Expanded(
                          child: RowChipDates(
                        label: 'See all',
                        isSelected: true,
                        backgroundColor: const Color(0xFFEEE5FF),
                        color: const Color(0xFF7F3DFF),
                        // selected: 0,
                        onSelected: () {},
                      ))
                    ],
                  )),
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 27,
                ),
                children: const [
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
