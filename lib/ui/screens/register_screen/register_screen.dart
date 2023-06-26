import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/main.dart';
import 'package:expence_project/ui/common/input_field.dart';
import 'package:expence_project/ui/common/my_button.dart';
import 'package:flutter/widgets.dart';

import '../../common/my_back_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(children: [
          const MyBackButton(),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register",
                  style: $styles.text.quote1,
                ),
                const Gap(16),
                Text(
                  'And start tracking your money',
                  style: $styles.text.quote2Sub
                      .copyWith(color: $styles.colors.caption, height: 0),
                ),
                const Gap(32),
                // FULL NAME
                MyInputField(
                    title: "Full Name",
                    hint: "Example: John Doe",
                    color: $styles.colors.textWhite),
                const Gap(16),

                // EMAIL
                MyInputField(
                    title: "Email",
                    hint: "Example: JohnDoe@gmail.com",
                    color: $styles.colors.textWhite),
                const Gap(16),

                // PASSWORD
                MyInputField(
                    title: "Password",
                    hint: "******",
                    color: $styles.colors.textWhite),
                const Gap(16),

                // RETYPE PASSWORD
                MyInputField(
                    title: "Retype Password",
                    hint: "******",
                    color: $styles.colors.textWhite),
                const Gap(16),

                // REGISTER BUTTON
                MyButton(
                  title: "Register",
                  onPressed: () {},
                  color: $styles.colors.accent1,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
