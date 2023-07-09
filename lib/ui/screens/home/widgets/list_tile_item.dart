part of '../home_screens.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 89,
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Color(0xFFFCEED4),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              Icons.shopping_bag_rounded,
              size: 40,
              color: $styles.colors.accent1,
            ),
          ),
          Gap(9),
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
                    Spacer(),
                    Text(
                      '-120',
                      style: $styles.text.bodyBold,
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Shopping',
                      style: $styles.text.bodyBold,
                    ),
                    Spacer(),
                    Text(
                      '-120',
                      style: $styles.text.bodyBold,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
