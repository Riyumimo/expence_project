part of '../record_keeping_screens.dart';

class RecordInputField extends StatelessWidget {
  const RecordInputField({
    super.key,
    required TextEditingController textMoneyController,
  }) : _textMoneyController = textMoneyController;

  final TextEditingController _textMoneyController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: const TextInputType.numberWithOptions(),
      style: $styles.text.h1.copyWith(color: Colors.white),
      controller: _textMoneyController,
      decoration: InputDecoration(
          hintText: '0',
          hintStyle: $styles.text.h1.copyWith(color: Colors.white),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0)),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0))),
    );
  }
}
