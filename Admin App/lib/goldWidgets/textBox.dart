import 'package:flutter/material.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';

class TextBox extends StatefulWidget {
  final double height;
  final double width;
  final String hintText;
  final bool autoCorrect;
  final int maxLines;
  final EdgeInsetsGeometry margin;
  final TextEditingController controller;
  final String initialvalue;
  final Function (String) onChanged;
  

  const TextBox(
      {Key key,
      this.height = 50,
      this.hintText = '',
      this.autoCorrect = true,
      this.maxLines = 1,
      this.margin = const EdgeInsets.symmetric(vertical: 15),
      this.width = double.maxFinite,
    this.controller, this.initialvalue,
    this.onChanged
  })
      : super(key: key);
  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      margin: widget.margin,
      alignment: Alignment.center,
      width: widget.width,
      height: widget.height,
      color: Color.fromRGBO(16, 16, 16, 8),
      child: TextFormField(
        initialValue: widget.initialvalue ,
        onChanged:widget.onChanged,
        controller: widget.controller,
        maxLines: widget.maxLines,
        style: commonTextStyle,
        enableSuggestions: true,
        autocorrect: widget.autoCorrect,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[700]),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
