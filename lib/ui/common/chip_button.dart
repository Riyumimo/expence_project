import '../../commons_libs.dart';
import '../../main.dart';

class RowChipButton extends StatelessWidget {
  const RowChipButton({
    super.key,
    required this.label,
    this.onSelected,
    required this.isSelected,
    this.backgroundColor = const Color(0xFFFCEED4),
    this.color = const Color(0xFFFCAC12),
  });
  final String label;
  final Function()? onSelected;
  final bool isSelected;
  final Color color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        height: 42,
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color: isSelected ? backgroundColor : Color(0xFFE3E5E5)),
            color: isSelected ? backgroundColor : $styles.colors.offWhite,
            borderRadius: BorderRadius.circular(24)),
        child: Center(
          child: Text(
            label,
            style: $styles.text.bodyBold.copyWith(color: color),
          ),
        ),
      ),
    );
  }
}
