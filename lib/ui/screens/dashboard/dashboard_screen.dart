import 'dart:math';

import 'package:animations/animations.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:expence_project/router.dart';
import 'package:expence_project/ui/screens/home/home_screens.dart';
import 'package:expence_project/ui/screens/transaction/page1.dart';

import '../../../commons_libs.dart';
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
    print('on index : $index');
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
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    print('initial : $initialTabIndex');

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
          const TabItem(icon: Icons.compare_arrows_rounded, title: 'Discovery'),
          TabItem<FloatingActionButton>(
              icon: FloatingActionButton.small(
                onPressed: () async {
                  setState(() {
                    toggle = !toggle;
                    _controller!.forward();
                  });
                  await showDialog(
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
                                    icon: const Icon(Icons.cloud_download_sharp,
                                        color: Colors.white),
                                    ontap: () {
                                      Future.delayed(
                                          const Duration(microseconds: 10), () {
                                        appRoute.pop();
                                      });
                                      appRoute.push(ScreenPaths.record,
                                          extra: 'Income');
                                    },
                                  ),
                                  PopupButton(
                                      aligment: alignment2,
                                      color: const Color(0xFF0077FF),
                                      icon: const Icon(
                                          Icons.screen_rotation_alt_rounded,
                                          color: Colors.white)),
                                  PopupButton(
                                    aligment: alignment3,
                                    color: const Color(0xFFFD3C4A),
                                    icon: const Icon(
                                      Icons.cloud_upload,
                                      color: Colors.white,
                                    ),
                                    ontap: () {
                                      Future.delayed(
                                          const Duration(microseconds: 10), () {
                                        appRoute.pop();
                                      });
                                      appRoute.push(ScreenPaths.record,
                                          extra: 'Expense');
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      });
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
          const TabItem(icon: Icons.message, title: 'Message'),
          const TabItem(icon: Icons.people, title: 'Profile'),
        ],

        onTap: (i) {
          print('ontap :$i');
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
}
