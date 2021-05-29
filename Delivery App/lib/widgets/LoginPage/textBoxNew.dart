import 'package:flutter/material.dart';
import 'package:foodie_delivery/setting.dart';

class TextBoxNew extends StatefulWidget {
  final String hint;
  final int max;
  final double height;

  final String initialvalue;
  final Function(String) onChanged;

  const TextBoxNew(
      {Key key,
      this.hint,
      this.max = 1,
      this.height = 50,
      this.initialvalue,
      this.onChanged})
      : super(key: key);

  @override
  _TextBoxNewState createState() => _TextBoxNewState();
}

class _TextBoxNewState extends State<TextBoxNew> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        // color: Colors.red,
        width: width,
        height: widget.height,
        child: TextFormField(
          initialValue: widget.initialvalue,
          onChanged: widget.onChanged,
          maxLines: widget.max,
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
      ),
    );
  }
}
