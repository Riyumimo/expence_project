import 'package:animations/animations.dart';
import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/main.dart';
import 'package:expence_project/ui/common/my_button.dart';
import 'package:flutter/material.dart';

class FinancialStatusScreen extends StatefulWidget {
  const FinancialStatusScreen({super.key});

  @override
  State<FinancialStatusScreen> createState() => _FinancialStatusScreenState();
}

class _FinancialStatusScreenState extends State<FinancialStatusScreen> {
  final PageController _pageController = PageController();
  final List<Color> _backgroundColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.blue,
  ];
  final List<String> _texts = [
    'You Spend',
    'You Earned',
    '2 of 12 Budget is exceeds the limit',
    '“Financial freedom is freedom from fear.”',
  ];

  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _backgroundColors.length,
                    itemBuilder: (context, index) {
                      final backgroundColor = _backgroundColors[index];
                      final text = _texts[index];

                      return Container(
                        color: backgroundColor,
                        child: PageTransitionSwitcher(
                          transitionBuilder:
                              (child, primaryAnimation, secondaryAnimation) =>
                                  FadeThroughTransition(
                            animation: primaryAnimation,
                            secondaryAnimation: secondaryAnimation,
                            child: child,
                          ),
                          child: Container(
                            color: backgroundColor,
                            child: SafeArea(
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Gap(42),
                                    _currentPage == 3
                                        ? Container()
                                        : Text(
                                            'This Month',
                                            style: $styles.text.quote2.copyWith(
                                                color: Colors.white
                                                    .withOpacity(.7)),
                                          ),
                                    _currentPage == 3 ? Container() : Spacer(),
                                    Column(
                                      children: [
                                        Text(
                                          text,
                                          textAlign: TextAlign.center,
                                          style: $styles.text.h2.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: $styles.colors.white),
                                        ),
                                        Gap(24),
                                        _currentPage == 2
                                            ? Row(
                                                children: [
                                                  Container(
                                                    width: 156,
                                                    height: 64,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(24)),
                                                  ),
                                                  Gap(8),
                                                  Expanded(
                                                    child: Container(
                                                      // width: 156,
                                                      height: 64,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      24)),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : _currentPage == 3
                                                ? Text(
                                                    '-Robert Kiyosaki',
                                                    textAlign: TextAlign.left,
                                                    style: $styles.text.quote2
                                                        .copyWith(
                                                            color: $styles
                                                                .colors.white),
                                                  )
                                                : Text(
                                                    '\$6000',
                                                    style: $styles.text.h1
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: $styles
                                                                .colors.white),
                                                  ),
                                      ],
                                    ),
                                    Spacer(),
                                    _currentPage == 2
                                        ? Container()
                                        : _currentPage == 3
                                            ? MyButton(
                                                title: 'See Full Detail',
                                                color: const Color(0xFF7F3DFF),
                                                onPressed: () {},
                                                // isTransparant: true,
                                              )
                                            : Container(
                                                width: 300,
                                                height: 231,
                                                decoration: BoxDecoration(
                                                    color: $styles.colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                              ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              top: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _backgroundColors.length,
                  (index) => buildDotIndicator(index),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDotIndicator(int index) {
    Color color = index == _currentPage ? Colors.grey : Colors.white;
    return Container(
      // padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(5),
      width: MediaQuery.sizeOf(context).width * .2,
      height: 4,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
    );
  }
}
