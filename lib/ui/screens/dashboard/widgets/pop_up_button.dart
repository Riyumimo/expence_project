part of '../dashboard_screen.dart';

class PopupButton extends StatelessWidget {
  const PopupButton({
    super.key,
    required this.aligment,
    this.ontap,
    required this.icon,
    required this.color,
  });

  final Alignment aligment;
  final Function()? ontap;
  final Icon icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: aligment,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Material(
          color: Colors.transparent,
          child: IconButton(splashRadius: 25, onPressed: ontap, icon: icon),
        ),
      ),
    );
  }
}
