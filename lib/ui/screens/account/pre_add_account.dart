import 'package:expence_project/commons_libs.dart';

class PreAddAccountScreen extends StatelessWidget {
  const PreAddAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
          SharedAxisTransition(
        animation: primaryAnimation,
        secondaryAnimation: secondaryAnimation,
        transitionType: SharedAxisTransitionType.horizontal,
        child: child,
      ),
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Gap(67),
              Text(
                'Let’s setup your account!',
                style: $styles.text.quote1.copyWith(fontSize: 36),
              ),
              Gap(37),
              Text(
                'Account can be your bank, credit card or your wallet',
                style: $styles.text.body,
              ),
              Spacer(),
              MyButton(
                title: 'Let`s go',
                onPressed: () => appRoute.go(ScreenPaths.addAccount),
              )
            ],
          ),
        )),
      ),
    );
  }
}
