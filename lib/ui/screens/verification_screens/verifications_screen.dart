import '../../../commons_libs.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SeparatedColumn(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
      mainAxisAlignment: MainAxisAlignment.center,
      separatorBuilder: () => const SizedBox(
        height: 24,
      ),
      children: [
        SizedBox(
          width: 312,
          height: 312,
          child: Image.asset('assets/images/verification.png',
              fit: BoxFit.contain),
        ),
        Text(
          "Your email is on the way",
          style: $styles.text.quote2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Check your email test@test.com and follow the instructions to reset your password',
                style: $styles.text.quote2Sub,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),
          ),
        ),
        const Spacer(),
        MyButton(
          title: "Back to Login",
          onPressed: () {
            appRoute.go(ScreenPaths.login);
          },
          color: $styles.colors.accent1,
        )
      ],
    ));
  }
}
