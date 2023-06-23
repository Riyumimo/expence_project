import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
  await Future.delayed(const Duration(milliseconds: 500), () {
    return FlutterNativeSplash.remove();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // showSemanticsDebugger: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    ScreenUtil.init(context, designSize: Size(width, height));
    return Scaffold(
      // backgroundColor: Color(0xFFE5E5E5),
      appBar: AppBar(
          // backgroundColor: Colors.amber,
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
                    Gap(16),
                    Text(
                      "Management Your Money",
                      style: GoogleFonts.inter(
                          // fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: const Color(0xFF827D89)),
                    ),
                    Gap(32),
                    // Text(
                    //   "Email Adderss",
                    //   style: GoogleFonts.inter(
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 16,
                    //     // color: const Color(0xFF827D89),
                    //   ),
                    // ),

                    MyInputField(
                        title: "Email Address",
                        hint: "Example: johndoe@gmail.com",
                        color: Color(0xFFC8C5CB)),
                    Gap(16),
                    MyInputField(
                        title: "Password",
                        hint: "******",
                        color: Color(0xFFC8C5CB)),
                    Gap(12),
                    myTextButton(),
                    Gap(32),
                    myButton(),
                    Gap(16),
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

                    Gap(16),
                    myButton(),
                    Gap(24),
                    Center(child: myTextButton())
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  InkWell myTextButton() {
    return InkWell(
      onTap: () => print('test'),
      child: Text(
        "Email Adderss",
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          decoration: TextDecoration.underline,
          color: const Color(0xFF6A3EA1),
        ),
      ),
    );
  }

  Container myButton() {
    return Container(
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(
          color: Color(0xFF6A3EA1), borderRadius: BorderRadius.circular(100)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Spacer(),
            Text(
              "Login",
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: Colors.white),
            ),
            Spacer(),
            const Icon(
              Icons.arrow_forward,
              size: 24,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class MyInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? textEditingController;
  final Widget? widget;

  final Color color;

  const MyInputField({
    Key? key,
    required this.title,
    required this.hint,
    this.textEditingController,
    required this.color,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Gap(10),
          Container(
            height: 52,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
                border: Border.all(color: color, width: 0.5),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              children: [
                Expanded(
                    child: TextFormField(
                  readOnly: widget == null ? false : true,
                  autofocus: false,
                  controller: textEditingController,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    // color: const Color(0xFF827D89),
                  ),
                  decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: const Color(0xFFC8C5CB)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0))),
                )),
                widget == null
                    ? Container()
                    : Container(
                        child: widget,
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
