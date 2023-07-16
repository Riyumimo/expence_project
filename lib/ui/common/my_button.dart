import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/main.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Color? color;
  final bool isTransparant;
  const MyButton(
      {super.key,
      required this.title,
      this.onPressed,
      this.color,
      this.isTransparant = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 54,
        decoration: BoxDecoration(
            color: isTransparant ? $styles.colors.offWhite : color,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                width: isTransparant ? .5 : 0,
                color: isTransparant ? $styles.colors.greyStrong : color!)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Spacer(),
              isTransparant
                  ? SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset(
                        'assets/logo/google.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox(
                      height: 24,
                      width: 24,
                    ),
              isTransparant
                  ? const SizedBox(
                      width: 15,
                    )
                  : const SizedBox(),
              Text(title,
                  style: $styles.text.bodyBold.copyWith(
                      fontSize: 15,
                      color: isTransparant
                          ? $styles.colors.black
                          : $styles.colors.offWhite)),
              const Spacer(),
              Icon(
                Icons.arrow_forward,
                size: 24,
                color: isTransparant
                    ? $styles.colors.black
                    : $styles.colors.offWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
