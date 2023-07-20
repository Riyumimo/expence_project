part of '../screens/home/home_screens.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    super.key,
    this.ontap,
  });
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: SizedBox(
        width: double.infinity,
        height: 89,
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: const Color(0xFFFCEED4),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.shopping_bag_rounded,
                size: 40,
                color: $styles.colors.accent1,
              ),
            ),
            const Gap(9),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Shopping',
                        style: $styles.text.bodyBold,
                      ),
                      const Spacer(),
                      Text(
                        '\$-120',
                        style: $styles.text.bodyBold
                            .copyWith(color: Colors.red[800]),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Buy some groceries',
                        style: $styles.text.body,
                      ),
                      const Spacer(),
                      Text(
                        '10:00 AM',
                        style: $styles.text.body,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
