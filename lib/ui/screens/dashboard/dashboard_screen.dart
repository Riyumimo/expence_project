import 'dart:math';

import 'package:animations/animations.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:expence_project/router.dart';
import 'package:expence_project/ui/screens/home/home_screens.dart';
import 'package:expence_project/ui/screens/transaction_screen/transaction_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../commons_libs.dart';
import '../../../logic/account_bloc/account_bloc.dart';
import '../../../main.dart';
import '../page1 copy 2.dart';
import '../page1 copy.dart';

part './widgets/pop_up_button.dart';

@immutable
class DashboardScreen extends StatefulWidget {
  final int initialTabIndex;
  const DashboardScreen({
    super.key,
    this.initialTabIndex = 0,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  int? initialTabIndex;
  PageController? _pageController;
  late TabController tabController;
  @override
  void initState() {
    // BlocProvider.of<AuthenticationBloc>(context)
    //     .add(AuthenticationEvent.getSignIn(repo.firebaseAuth));
    BlocProvider.of<AccountBloc>(context).add(const AccountEvent.started());
    initialTabIndex = widget.initialTabIndex;
    _pageController = PageController(initialPage: initialTabIndex!);
    tabController = TabController(length: 5, vsync: this);
    if (initialTabIndex! >= 2) {
      final tabIndex = initialTabIndex!;
      tabController.animateTo(
        tabIndex + 1,
      );
    } else {
      tabController.animateTo(
        initialTabIndex!,
      );
    }
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 375));
    _animations = CurvedAnimation(
        parent: _controller!,
        curve: Curves.easeOut,
        reverseCurve: Curves.easeIn);

    _controller!.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  AnimationController? _controller;
  Animation? _animations;
  bool toggle = true;

  Alignment alignment1 = const Alignment(-0.4, -0.6);
  Alignment alignment2 = const Alignment(-0.0, -1.5);
  Alignment alignment3 = const Alignment(0.4, -0.6);

  void onChangePage(int index) {
    setState(() {
      initialTabIndex = index;
      if (index >= 2) {
        tabController.animateTo(initialTabIndex! + 1);
      } else {
        tabController.animateTo(initialTabIndex!);
      }
    });
  }

  void changePage(int index) {
    setState(() {
      initialTabIndex = index;
    });
  }

  @override
  void dispose() {
    tabController;
    _controller;
    _pageController;
    initialTabIndex;
    super.dispose();
  }

  final List<Widget> _buildScreens = [
    const HomeScreens(),
    const TransactionScreen(),
    const Page2(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (_, index) {
          index = initialTabIndex!;
          return PageTransitionSwitcher(
              transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
                return FadeThroughTransition(
                  animation: primaryAnimation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                );
              },
              child: _buildScreens[index]);
        },
        controller: _pageController,
        // children: _buildScreens,
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        // top: 1,
        curveSize: -100,
        height: 70,
        initialActiveIndex: initialTabIndex!,
        color: $styles.colors.greyMedium,
        activeColor: $styles.colors.accent1,
        backgroundColor: $styles.colors.offWhite,
        elevation: 0,
        controller: tabController,
        items: [
          TabItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/home.svg',
              ),
              icon: SvgPicture.asset(
                'assets/icons/inactive_home.svg',
              ),
              title: 'Home'),
          TabItem(
              activeIcon: SvgPicture.asset(
                'assets/icons/transaction.svg',
              ),
              icon: SvgPicture.asset(
                'assets/icons/inactive_transaction.svg',
              ),
              title: 'Discovery'),
          TabItem<FloatingActionButton>(
              icon: FloatingActionButton.small(
                onPressed: () async {
                  setState(() {
                    toggle = !toggle;
                    _controller!.forward();
                  });
                  await showTabIcon(context);
                  setState(() {
                    toggle = !toggle;
                    _controller!.reverse();
                  });
                },
                splashColor: $styles.colors.offWhite,
                elevation: 0,
                child: Transform.rotate(
                    angle: _animations!.value * pi * (3 / 4),
                    child: const Icon(
                      Icons.add,
                      size: 34,
                    )),
              ),
              title: 'Add'),
          TabItem(
              icon: SvgPicture.asset(
                'assets/icons/inactive_pie-chart.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/pie-chart.svg',
              ),
              title: 'Message'),
          TabItem(
              icon: SvgPicture.asset(
                'assets/icons/inactive_user.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/user.svg',
              ),
              title: 'Profile'),
        ],

        onTap: (i) {
          switch (i) {
            case 0:
              changePage(i);
              break;
            case 1:
              setState(() {
                initialTabIndex = i;
                changePage(initialTabIndex!);
              });
              break;
            case 2:
            case 3:
              setState(() {
                initialTabIndex = i - 1;
                changePage(initialTabIndex!);
              });

            case 4:
              setState(() {
                initialTabIndex = i - 1;
                changePage(initialTabIndex!);
              });
            default:
          }
        },
      ),
    );
  }

  Future<dynamic> showTabIcon(BuildContext context) {
    return showDialog(
        anchorPoint: const Offset(200, 200),
        barrierColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Column(
            children: [
              const Spacer(),
              SizedBox(
                // color: Colors.amber,
                height: 150,
                child: Stack(
                  children: [
                    PopupButton(
                      aligment: alignment1,
                      color: const Color(0xFF00A86B),
                      icon: SvgPicture.asset(
                        'assets/icons/income.svg',
                      ),
                      ontap: () {
                        Future.delayed(const Duration(microseconds: 10), () {
                          appRoute.pop();
                        });
                        appRoute.push(ScreenPaths.record, extra: 'Income');
                      },
                    ),
                    PopupButton(
                      aligment: alignment2,
                      color: const Color(0xFF0077FF),
                      icon: SvgPicture.asset(
                        'assets/icons/currency-exchange.svg',
                      ),
                      ontap: () async {},
                    ),
                    PopupButton(
                      aligment: alignment3,
                      color: const Color(0xFFFD3C4A),
                      icon: SvgPicture.asset(
                        'assets/icons/expense.svg',
                      ),
                      ontap: () {
                        Future.delayed(const Duration(microseconds: 10), () {
                          appRoute.pop();
                        });
                        appRoute.push(ScreenPaths.record, extra: 'Expense');
                      },
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}
