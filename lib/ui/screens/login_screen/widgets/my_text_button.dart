part of '../login_screen.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({super.key, required this.title, this.onPressed});
  final String title;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        title,
        style: $styles.text.bodySmallBold.copyWith(
            color: $styles.colors.accent1,
            fontSize: 15,
            decoration: TextDecoration.underline),
      ),
    );
  }
}
