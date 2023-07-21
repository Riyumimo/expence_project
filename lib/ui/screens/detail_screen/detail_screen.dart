import 'package:animations/animations.dart';
import 'package:expence_project/router.dart';
import 'package:expence_project/ui/common/my_button.dart';
import '../../../commons_libs.dart';
import '../../../main.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.title});
  final String title;

  Color? colorScheme(String title) {
    switch (title) {
      case 'Expense':
        return const Color(0xFFFD3C4A);
      case 'Income':
        return const Color(0xFF00A86B);
      case 'Transfer':
        return const Color(0xFF0077FF);
      default:
        return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return PageTransitionSwitcher(
      transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
          FadeThroughTransition(
        animation: primaryAnimation,
        secondaryAnimation: secondaryAnimation,
        child: child,
      ),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            SeparatedColumn(
              separatorBuilder: () => const Gap(16),
              children: [
                Container(
                  height: height * .34,
                  decoration: BoxDecoration(
                    color: colorScheme(title) ?? Colors.amber,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                  child: Center(
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 16),
                            child: SizedBox(
                              // padding: const EdgeInsets.all(16),
                              height: height * .0788,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      // iconSize: 32,
                                      onPressed: () {
                                        appRoute.pop();
                                      },
                                      icon: SvgPicture.asset(
                                          'assets/icons/arrow-left.svg')),
                                  Text(
                                    'Detail Transaction',
                                    textAlign: TextAlign.center,
                                    style: $styles.text.quote2.copyWith(
                                      fontSize: 18,
                                      color: Colors.white,
                                      height: 0,
                                    ),
                                  ),
                                  IconButton(
                                      // iconSize: 32,
                                      onPressed: () {
                                        modalBottomSheet(context, height);
                                      },
                                      icon: SvgPicture.asset(
                                          'assets/icons/trash.svg'))
                                ],
                              ),
                            ),
                          ),
                          // const Gap(16),
                          SizedBox(
                            height: height * .08,
                            child: Text(
                              '\$120',
                              style: $styles.text.quote1.copyWith(
                                height: 1,
                                fontSize: 48,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            'Buy some grocery',
                            style: $styles.text.body.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'Saturday 4 June 2021 16:20',
                            style: $styles.text.body.copyWith(
                              fontSize: 13,
                              color: const Color(0xFFFCFCFC),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SeparatedColumn(
                      separatorBuilder: () => const Gap(16),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(12),
                        Divider(
                          thickness: 2,
                          color: $styles.colors.greyMedium,
                        ),
                        Text(
                          'Description',
                          style: $styles.text.bodyBold,
                        ),
                        SizedBox(
                          height: height * .0936,
                          child: Text(
                            'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
                            style: $styles.text.body,
                            textAlign: TextAlign.justify,
                            maxLines: 5,
                          ),
                        ),
                        Text(
                          'Attachment',
                          style: $styles.text.bodyBold,
                        ),
                        Container(
                          height: 116,
                          decoration: BoxDecoration(
                            color: $styles.colors.accent1,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const Spacer(),
                        MyButton(
                          title: 'Edit',
                          color: $styles.colors.accent1,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: height / 2 - height * .1847,
              child: Container(
                height: 70,
                width: width * .914,
                padding: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: const Color(0xFFF1F1FA)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Type',
                          style: $styles.text.body.copyWith(
                            color: const Color(0xFF91919F),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Income',
                          style: $styles.text.bodyBold,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Type',
                          style: $styles.text.body.copyWith(
                            color: const Color(0xFF91919F),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Income',
                          style: $styles.text.bodyBold,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Type',
                          style: $styles.text.body.copyWith(
                            color: const Color(0xFF91919F),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Income',
                          style: $styles.text.bodyBold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> modalBottomSheet(BuildContext context, double height) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: height * .2617,
          decoration: BoxDecoration(
            color: $styles.colors.offWhite,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Remove this transaction?',
                  style: $styles.text.quote2
                      .copyWith(fontSize: 18, height: 0, wordSpacing: 0),
                ),
                Text(
                  'Are you sure do you wanna remove this transaction?',
                  textAlign: TextAlign.center,
                  style: $styles.text.body,
                ),
                Gap(16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEEE5FF),
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            'No',
                            style: $styles.text.quote2.copyWith(
                                fontSize: 18, color: $styles.colors.accent1),
                          ),
                        ),
                      ),
                    ),
                    const Gap(16),
                    Expanded(
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                            color: $styles.colors.accent1,
                            borderRadius: BorderRadius.circular(16)),
                        child: Center(
                          child: Text(
                            'Yes',
                            style: $styles.text.quote2.copyWith(
                                fontSize: 18, color: const Color(0xFFEEE5FF)),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
