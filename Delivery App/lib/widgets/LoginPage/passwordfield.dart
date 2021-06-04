import 'package:flutter/material.dart';
import 'package:foodie_delivery/setting.dart';

class PasswordField extends StatefulWidget {
  final String hint;
  final Function(String) onChanged;

  const PasswordField({
    Key key,
    this.hint,
    this.onChanged,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.red,
      width: width,
      height: 50,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a password';
          }
          return null;
        },
        onChanged: widget.onChanged,
        obscureText: true,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: themegreenlight,
            width: 4,
          )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: themegreenlight,
            width: 4,
          )),
          hintText: widget.hint,
        ),
      ),
    );
  }
}
