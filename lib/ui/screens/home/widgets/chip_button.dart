part of '../home_screens.dart';

class RowChipDates extends StatelessWidget {
  const RowChipDates({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('testing');
      },
      child: Container(
        height: 34,
        decoration: BoxDecoration(
            color: Color(0xFFFCEED4), borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Text(
            'Today',
            style: $styles.text.bodyBold.copyWith(color: Color(0xFFFACA12)),
          ),
        ),
      ),
    );
  }
}
