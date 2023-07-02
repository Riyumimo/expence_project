import 'package:expence_project/logic/auth/authentication_bloc.dart';
import 'package:expence_project/main.dart';
import 'package:expence_project/router.dart';
import 'package:expence_project/ui/common/my_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../commons_libs.dart';
import '../../common/input_field.dart';

part './widgets/my_text_button.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginScreens> {
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureTextPassword = true;

  void load() {
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        state.map(
            intial: (intial) {},
            authenticated: (value) {},
            loaded: (loaded) {
              setState(() {
                isLoading = loaded.isLoading;
              });
            },
            unauthenticated: (unauthenticated) {},
            error: (value) {
              showDialog(
                  context: context,
                  builder: (BuildContext build) {
                    return CustomDialog();
                    // return AlertDialog(
                    //   title: const Text("Error Message"),
                    //   content: Text(value.message),
                    //   actions: [
                    //     ElevatedButton(
                    //         onPressed: () {
                    //           context.read<AuthenticationBloc>().add(
                    //               AuthenticationEvent.getSignIn(
                    //                   repo.firebaseAuth));
                    //         },
                    //         child: const Text("Ok"))
                    //   ],
                    // );
                  });
            });
      },
      builder: (context, state) {
        print('isLoading : $isLoading');
        return Scaffold(
          // backgroundColor: Color(0xFFE5E5E5),
          appBar: AppBar(
            backgroundColor: $styles.colors.offWhite,
            elevation: 0,
          ),
          body: Stack(
            children: [
              IgnorePointer(
                ignoring: isLoading,
                child: Opacity(
                  opacity: isLoading ? 0.8 : 1,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Gap(height * .05),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Let's Login",
                                  style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 32),
                                ),
                                const Gap(16),
                                Text(
                                  "Management Your Money",
                                  style: GoogleFonts.inter(
                                      // fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: const Color(0xFF827D89)),
                                ),
                                const Gap(32),
                                MyInputField(
                                    title: "Email Address",
                                    textEditingController: emailController,
                                    hint: "Example: johndoe@gmail.com",
                                    color: Color(0xFFC8C5CB)),
                                const Gap(16),
                                MyInputField(
                                    title: "Password",
                                    hint: "******",
                                    textEditingController: passwordController,
                                    isPassword: true,
                                    obscureText: _obscureTextPassword,
                                    icon: _obscureTextPassword
                                        ? const Icon(
                                            Icons.visibility,
                                          )
                                        : const Icon(
                                            Icons.visibility_off,
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureTextPassword =
                                            !_obscureTextPassword;
                                      });
                                    },
                                    color: Color(0xFFC8C5CB)),
                                const Gap(12),
                                MyTextButton(
                                  title: "Forgot password",
                                  onPressed: () {},
                                ),
                                const Gap(32),
                                MyButton(
                                  title: "Login",
                                  onPressed: () {
                                    context.read<AuthenticationBloc>().add(
                                        AuthenticationEvent.signInWithEmail(
                                            emailController.text,
                                            passwordController.text));
                                  },
                                  color: $styles.colors.accent1,
                                ),
                                const Gap(16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        height: .2,
                                        width: 100,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Or",
                                      style: $styles.text.bodySmall,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: .2,
                                        width: 100,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(16),
                                MyButton(
                                  title: "Login With Google",
                                  isTransparant: true,
                                  onPressed: () async {
                                    // GET google sign in here
                                    context.read<AuthenticationBloc>().add(
                                        AuthenticationEvent.signInWithGoogle());
                                  },
                                ),
                                const Gap(24),
                                Center(
                                    child: MyTextButton(
                                  title: "Don't have account? Register here",
                                  onPressed: () {
                                    appRoute.go(ScreenPaths.register);
                                  },
                                ))
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
            // padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                'Testing',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text('content'),
              SizedBox(height: 24.0),
              Container(
                width: double.infinity,
                // padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.black,
                      height: 50,
                    ),
                    Divider(
                      color: Colors.white,
                      height: 1,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        child: SizedBox(
                          // color: Colors.red,
                          height: 50,
                          child: Center(child: Text('cancel')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
