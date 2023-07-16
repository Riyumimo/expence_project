part of '../home_screens.dart';

class IncomeExpenseWidget extends StatelessWidget {
  const IncomeExpenseWidget({
    super.key,
    this.ontap,
    required this.icon,
    this.color,
    required this.amount,
    required this.title,
  });
  final Function()? ontap;
  final Icon icon;
  final Color? color;
  final String amount;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(16)),
        child: SeparatedRow(
          padding: const EdgeInsets.all(16),
          crossAxisAlignment: CrossAxisAlignment.center,
          separatorBuilder: () => const Gap(10),
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Icon(
                Icons.trending_up,
                size: 32,
                color: color,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: $styles.text.body.copyWith(color: Colors.white),
                ),
                Text(
                  amount,
                  style: $styles.text.quote2.copyWith(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
