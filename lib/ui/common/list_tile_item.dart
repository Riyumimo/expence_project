part of '../screens/home/home_screens.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    super.key,
    this.ontap,
  });
  final Function()? ontap;

  Color? colorIcon(String category) {
    switch (category) {
      case "Food":
        return Colors.amber;
      case "Subcriptions":
        return Colors.red;
      case "Shoping":
        return Colors.green;
      case "Monthly":
        return Colors.amber;
      default:
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Card(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        splashColor: $styles.colors.accent1.withOpacity(.3),
        hoverColor: $styles.colors.accent1.withOpacity(.3),
        onTap: ontap,
        child: SizedBox(
          width: double.infinity,
          height: height * 0.1099,
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
      ),
    );
  }
}
