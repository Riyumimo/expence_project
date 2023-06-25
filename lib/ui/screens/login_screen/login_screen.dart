import 'package:expence_project/main.dart';
import 'package:expence_project/ui/common/my_button.dart';

import '../../../commons_libs.dart';
import '../../common/input_field.dart';

part './widgets/my_text_button.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LoginScreens> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    ScreenUtil.init(context, designSize: Size(width, height));
    return Scaffold(
      // backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
        backgroundColor: $styles.colors.offWhite,
        elevation: 0,
      ),
      body: Padding(
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
                          fontWeight: FontWeight.w700, fontSize: 32),
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
                          style: GoogleFonts.inter(
                            // fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            // decoration: TextDecoration.underline,
                            color: const Color(0xFF827D89),
                          ),
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
                      onPressed: () {
                        // GET google sign in here
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
    );
  }
}
