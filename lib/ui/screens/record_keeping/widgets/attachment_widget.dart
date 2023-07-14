part of '../record_keeping_screens.dart';

class AttachmentWidget extends StatelessWidget {
  const AttachmentWidget({
    super.key,
    this.ontap,
  });
  final Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        highlightColor: $styles.colors.white,
        onTap: ontap,
        child: DottedBorder(
          color: $styles.colors.white,
          dashPattern: [8, 6],
          radius: Radius.circular(8),
          borderType: BorderType.RRect,
          child: Container(
            height: 52,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                    angle: 208 * (pi / 180),
                    child: Icon(
                      Icons.attach_file,
                      color: $styles.colors.textWhite,
                    )),
                const Gap(10),
                Text(
                  'Add attachement',
                  style: $styles.text.bodyBold.copyWith(
                      fontWeight: FontWeight.w400,
                      color: $styles.colors.textWhite),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
