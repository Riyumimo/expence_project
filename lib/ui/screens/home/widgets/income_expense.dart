part of '../home_screens.dart';

class IncomeExpenseWidget extends StatelessWidget {
  const IncomeExpenseWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 90,
        decoration: BoxDecoration(
            color: $styles.colors.accent1,
            borderRadius: BorderRadius.circular(16)),
        child: SeparatedRow(
          padding: EdgeInsets.all(16),
          crossAxisAlignment: CrossAxisAlignment.center,
          separatorBuilder: () => Gap(10),
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Icon(
                Icons.trending_up,
                size: 32,
                color: $styles.colors.accent1,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Income',
                    style: $styles.text.body,
                  ),
                  Text(
                    '\$5000',
                    style: $styles.text.quote2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
