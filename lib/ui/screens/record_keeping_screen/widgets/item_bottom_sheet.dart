part of '../record_keeping_screens.dart';

class ItemBottomSheet extends StatelessWidget {
  final Function()? ontap;

  final IconData? icon;

  final String title;

  const ItemBottomSheet({
    super.key,
    this.ontap,
    this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          // width: 107,
          height: 91,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: $styles.colors.accent1.withOpacity(.3),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: $styles.colors.accent1,
              ),
              Text(
                title,
                style: $styles.text.bodyBold.copyWith(
                    color: $styles.colors.accent1, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
