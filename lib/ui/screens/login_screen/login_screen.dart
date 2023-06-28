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

  @override
  void initState() {
    BlocProvider.of<AuthenticationBloc>(context)
        .add(AuthenticationEvent.getSignIn(repo.firebaseAuth));

    super.initState();
  }

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
            authenticated: (value) {
              appRoute.go(ScreenPaths.home);
            },
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
                    return AlertDialog(
                      title: const Text("Error Message"),
                      content: Text(value.message),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              context.read<AuthenticationBloc>().add(
                                  AuthenticationEvent.getSignIn(
                                      repo.firebaseAuth));
                            },
                            child: const Text("Ok"))
                      ],
                    );
                  });
            });
      },
      builder: (context, state) {
        print(isLoading);
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
                                const MyInputField(
                                    title: "Email Address",
                                    hint: "Example: johndoe@gmail.com",
                                    color: Color(0xFFC8C5CB)),
                                const Gap(16),
                                const MyInputField(
                                    title: "Password",
                                    hint: "******",
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
                                    // go to home screen
                                    appRoute.push(ScreenPaths.register);
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
                                  onPressed: () {},
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
