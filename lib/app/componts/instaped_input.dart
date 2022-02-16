import 'package:flutter/material.dart';

class InstapedInput extends StatelessWidget {
  final String label;
  final Icon suffixIcon;
  final Function suffixIconOnPressed;

  const InstapedInput(
      {Key? key,
      required this.label,
      this.suffixIcon,
      required this.suffixIconOnPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: this.label,
        suffixIcon: IconButton(
          onPressed: this.suffixIconOnPressed(),
          icon: this.suffixIcon,
        ),
      ),
    );
  }
}
