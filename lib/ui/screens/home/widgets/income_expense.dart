part of '../home_screens.dart';

class IncomeExpenseWidget extends StatelessWidget {
  const IncomeExpenseWidget({
    super.key,
    this.ontap,
    required this.icon,
    this.color,
    required this.amount,
    required this.title,
    // this.isExpense = false,
  });
  final Function()? ontap;
  final Widget icon;
  final Color? color;
  final String amount;
  final String title;
  // final bool isExpense;

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.sizeOf(context).width;
    // final height = MediaQuery.sizeOf(context).height;
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.only(left: 8),
        height: 90,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(28)),
        child: Row(
          // padding: const EdgeInsets.all(16),
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: icon),
            const Gap(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: $styles.text.title2.copyWith(
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFFCFCFC)),
                ),
                const Gap(4),
                Text(
                  amount,
                  style: $styles.text.quote2
                      .copyWith(fontSize: 22, color: const Color(0xFFFCFCFC)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
