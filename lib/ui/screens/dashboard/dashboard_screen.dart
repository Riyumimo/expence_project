import 'package:animations/animations.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:expence_project/ui/common/alert_dialog.dart';
import 'package:expence_project/ui/screens/home/home_screens.dart';
import 'package:expence_project/ui/screens/transaction/page1.dart';

import '../../../commons_libs.dart';
import '../../../main.dart';
import '../page1 copy 2.dart';
import '../page1 copy.dart';

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
    super.initState();
  }

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
        physics: NeverScrollableScrollPhysics(),
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
                // label: Icon(Icons.add),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (builder) => const AlertDialog1());
                },
                elevation: 0,
                child: const Icon(Icons.add),
              ),
              title: 'Add'),
          const TabItem(icon: Icons.message, title: 'Message'),
          const TabItem(icon: Icons.people, title: 'Profile'),
        ],
        // onTabNotify: (i) {
        //   print('test');
        //   return true;
        // },
        onTap: (i) {
          print('ontap :$i');
          switch (i) {
            case 0:
              changePage(i);
              // _pageController.jumpToPage(
              //   initialTabIndex!,
              // );
              break;
            case 1:
              setState(() {
                initialTabIndex = i;
                changePage(initialTabIndex!);

                // _pageController.animateToPage(initialTabIndex!,
                //     duration: const Duration(milliseconds: 100),
                //     curve: Curves.linear);
              });
              break;
            case 2:
            // setState(() {
            //   initialTabIndex = i;
            //   _pageController.animateToPage(initialTabIndex!,
            //       duration: const Duration(milliseconds: 100),
            //       curve: Curves.linear);
            // });

            case 3:
              setState(() {
                initialTabIndex = i - 1;
                changePage(initialTabIndex!);
                // _pageController.jumpToPage(
                //   initialTabIndex!,
                // );
              });

            case 4:
              setState(() {
                initialTabIndex = i - 1;
                changePage(initialTabIndex!);
                // _pageController.animateToPage(initialTabIndex!,
                //     duration: const Duration(milliseconds: 100),
                // curve: Curves.linear);
              });
            default:
          }
        },
      ),
    );
  }
}
