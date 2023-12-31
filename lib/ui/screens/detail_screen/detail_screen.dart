import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';

import '../../../commons_libs.dart';
import '../../../data/models/transaction_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.transaction,
  });
  final TransactionModel transaction;

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

  String _getDateTime(DateTime dateTime) {
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    // print('url${transaction.url}');
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
                    color: colorScheme(transaction.type!) ?? Colors.amber,
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
                              '\$ ${transaction.amount}',
                              style: $styles.text.quote1.copyWith(
                                height: 1,
                                fontSize: 48,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            transaction.description ?? '....',
                            style: $styles.text.body.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            _getDateTime(transaction.createdAt!),
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
                            transaction.description ?? '',
                            style: $styles.text.body,
                            textAlign: TextAlign.justify,
                            maxLines: 5,
                          ),
                        ),
                        Text(
                          'Attachment',
                          style: $styles.text.bodyBold,
                        ),
                        transaction.url != null && transaction.url != ''
                            ? Container(
                                height: 116,
                                decoration: BoxDecoration(
                                  // color: $styles.colors.accent1,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.network(transaction.url ?? ''))
                            : DottedBorder(
                                dashPattern: const [5, 5],
                                color: $styles.colors.textWhite,
                                child: SizedBox(
                                  height: 100,
                                  child: Center(
                                      child: Text(
                                    'No Image',
                                    style: $styles.text.quote2.copyWith(
                                        color: $styles.colors.textWhite),
                                  )),
                                )),
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
                          transaction.type ?? '',
                          style: $styles.text.bodyBold,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Category',
                          style: $styles.text.body.copyWith(
                            color: const Color(0xFF91919F),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          transaction.category ?? '',
                          style: $styles.text.bodyBold,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Wallet',
                          style: $styles.text.body.copyWith(
                            color: const Color(0xFF91919F),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          transaction.type ?? '',
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
                const Gap(16),
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
