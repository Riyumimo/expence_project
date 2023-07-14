import 'package:expence_project/main.dart';

import '../../commons_libs.dart';

class MyInputField extends StatelessWidget {
  final String? title;
  final String hint;
  final TextEditingController? textEditingController;
  final Widget? widget;
  final bool isPassword;
  final bool? obscureText;
  final bool? colorText;
  final Function()? onPressed;
  final Icon? icon;

  final Color color;

  const MyInputField({
    Key? key,
    this.title,
    required this.hint,
    this.isPassword = false,
    this.textEditingController,
    required this.color,
    this.widget,
    this.onPressed,
    this.icon,
    this.obscureText,
    this.colorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title != null
            ? Text(
                title!,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              )
            : Container(),
        title != null ? const Gap(10) : const Gap(0),
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
                keyboardType: isPassword
                    ? TextInputType.visiblePassword
                    : TextInputType.emailAddress,
                obscureText: obscureText ?? false,
                readOnly: widget == null ? false : true,
                autofocus: false,
                controller: textEditingController,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  // color: const Color(0xFF827D89),
                ),
                decoration: InputDecoration(
                    suffixIcon: isPassword
                        ? IconButton(
                            icon: icon!,
                            onPressed: onPressed,
                          )
                        : Container(
                            width: 1,
                          ),
                    hintText: hint,
                    hintStyle: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: colorText == null
                            ? $styles.colors.textWhite
                            : colorText == false
                                ? $styles.colors.textWhite
                                : $styles.colors.black),
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
    );
  }
}
