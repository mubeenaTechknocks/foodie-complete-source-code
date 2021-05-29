import 'package:flutter/material.dart';
import 'package:foodieshop/goldWidgets/goldSetting.dart';

class TextBox1 extends StatefulWidget {
  final double height;
  final double width;
  final String hintText;
  final String initialValue;
  final bool autoCorrect;
  final int maxLines;
  final EdgeInsetsGeometry margin;
  final Function(String) onChanged;
  final TextInputAction textInputAction;
  const TextBox1({
    Key key,
    this.height = 50,
    this.hintText = '',
    this.autoCorrect = true,
    this.maxLines = 1,
    this.margin = const EdgeInsets.symmetric(vertical: 15),
    this.width = double.maxFinite,
    this.onChanged,
    this.textInputAction = TextInputAction.next,
    this.initialValue,
  }) : super(key: key);
  @override
  _TextBox1State createState() => _TextBox1State();
}

class _TextBox1State extends State<TextBox1> {
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
        initialValue: widget.initialValue,
        textInputAction: widget.textInputAction,
        onChanged: widget.onChanged,
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
