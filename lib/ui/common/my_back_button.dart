import '../../commons_libs.dart';
import '../../main.dart';

class MyBackButton extends StatelessWidget {
  final Function()? onTap;
  const MyBackButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 54,
        child: Row(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {},
              child: Container(
                height: 22,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                      height: 20,
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 12,
                      ),
                    ),
                    SizedBox(
                      height: 22,
                      child: Text(
                        "Back to Login",
                        style: $styles.text.bodySmallBold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
