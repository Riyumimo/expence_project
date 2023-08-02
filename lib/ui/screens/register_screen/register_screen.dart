// ignore_for_file: avoid_print

import 'package:expence_project/commons_libs.dart';
import 'package:expence_project/ui/common/input_field.dart';

import '../../../logic/auth_bloc/authentication_bloc.dart';
import '../../common/my_back_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureTextPassword = true;
  bool _obscureTextRetypePassword = true;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          print(state);
          state.map(
              intial: (intial) {},
              authenticated: (value) {},
              unauthenticated: (unauthenticated) {},
              error: (value) {},
              loaded: (loaded) {
                setState(() {
                  isLoading = loaded.isLoading;
                });
              });
        },
        builder: (context, state) {
          print('IsLoading : $isLoading');
          return SafeArea(
            child: Stack(
              children: [
                ListView(children: [
                  MyBackButton(
                    onTap: () {
                      appRoute.go(ScreenPaths.login);
                    },
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 16, right: 16),
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
                          style: $styles.text.quote2Sub.copyWith(
                              color: $styles.colors.caption, height: 0),
                        ),
                        const Gap(32),
                        // FULL NAME
                        MyInputField(
                            title: "Full Name",
                            hint: "Example: John Doe",
                            textEditingController: fullNameController,
                            color: $styles.colors.textWhite),
                        const Gap(16),

                        // EMAIL
                        MyInputField(
                            title: "Email",
                            textEditingController: emailController,
                            hint: "Example: JohnDoe@gmail.com",
                            color: $styles.colors.textWhite),
                        const Gap(16),

                        // PASSWORD
                        MyInputField(
                            title: "Password",
                            hint: "******",
                            isPassword: true,
                            obscureText: _obscureTextPassword,
                            icon: _obscureTextPassword
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _obscureTextPassword = !_obscureTextPassword;
                              });
                            },
                            textEditingController: passwordController,
                            color: $styles.colors.textWhite),
                        const Gap(16),

                        // RETYPE PASSWORD
                        MyInputField(
                            title: "Retype Password",
                            hint: "******",
                            isPassword: true,
                            obscureText: _obscureTextRetypePassword,
                            icon: _obscureTextRetypePassword
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _obscureTextRetypePassword =
                                    !_obscureTextRetypePassword;
                              });
                            },
                            textEditingController: retypePasswordController,
                            color: $styles.colors.textWhite),
                        const Gap(16),

                        // REGISTER BUTTON
                        MyButton(
                          title: "Register",
                          onPressed: () {
                            print(passwordController.text);
                            print(
                                'this retype ${retypePasswordController.text}');
                            if (passwordController.text ==
                                retypePasswordController.text) {
                              context.read<AuthenticationBloc>().add(
                                  AuthenticationEvent.registerWithEmail(
                                      emailController.text,
                                      passwordController.text,
                                      fullNameController.text));

                              print('cliked');
                            } else {
                              print('password not match');
                            }
                          },
                          color: $styles.colors.accent1,
                        )
                      ],
                    ),
                  ),
                ]),
                if (isLoading)
                  Container(
                    color: $styles.colors.offWhite.withOpacity(.04),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
