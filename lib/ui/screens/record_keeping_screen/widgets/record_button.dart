part of '../record_keeping_screens.dart';

class RecordButton extends StatelessWidget {
  const RecordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('object');
      },
      child: Container(
        height: 54,
        width: double.infinity,
        decoration: BoxDecoration(
            color: $styles.colors.accent1,
            borderRadius: BorderRadius.circular(16)),
        child: Center(
            child: Text(
          'Continue',
          style:
              $styles.text.bodyBold.copyWith(fontSize: 18, color: Colors.white),
        )),
      ),
    );
  }
}
