import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:expence_project/ui/common/alert_dialog.dart';
import 'package:expence_project/ui/screens/home/home_screens.dart';
import 'package:expence_project/ui/screens/transaction/page1.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../commons_libs.dart';
import '../../../main.dart';
import '../page1 copy 2.dart';
import '../page1 copy.dart';

@immutable
class DashboardScreen extends StatefulWidget {
  int initialTabIndex;
  DashboardScreen({super.key, this.initialTabIndex = 0});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  int initialTabIndex = 0;
  final _pageController = PageController();
  late TabController tabController;
  @override
  void initState() {
    initialTabIndex = widget.initialTabIndex;
    tabController = TabController(length: 5, vsync: this);
    super.initState();
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
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            initialTabIndex = index;
            if (index >= 2) {
              tabController.animateTo(initialTabIndex + 1);
            } else {
              tabController.animateTo(initialTabIndex);
            }
          });
        },
        children: _buildScreens,
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        // top: 1,
        // curveSize: -100,
        height: 70,
        initialActiveIndex: widget.initialTabIndex,
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
              icon: FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (builder) => const AlertDialog1());
                },
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
              setState(() {
                initialTabIndex = i;
                _pageController.animateToPage(initialTabIndex,
                    duration: Duration(microseconds: 500),
                    curve: Curves.linear);

                print('ke page 1');
              });
              break;
            case 1:
              setState(() {
                initialTabIndex = i;
                _pageController.animateToPage(initialTabIndex,
                    duration: Duration(microseconds: 500),
                    curve: Curves.linear);
                print('ke page 1');
              });
              break;
            case 2:
              setState(() {
                initialTabIndex;
                _pageController.animateToPage(initialTabIndex,
                    duration: Duration(microseconds: 500),
                    curve: Curves.linear);
              });

            case 3:
              setState(() {
                initialTabIndex = i - 1;
                _pageController.animateToPage(initialTabIndex,
                    duration: Duration(microseconds: 500),
                    curve: Curves.linear);
              });

            case 4:
              setState(() {
                initialTabIndex = i - 1;
                _pageController.animateToPage(initialTabIndex,
                    duration: Duration(microseconds: 500),
                    curve: Curves.linear);
              });
            default:
          }
        },
      ),
    );
  }
}
