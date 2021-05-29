import 'package:flutter/material.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';

class SearchBar extends StatefulWidget {
  final Function(String) onChanged;

  const SearchBar({Key key, this.onChanged}) : super(key: key);
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: width,
        child: TextFormField(
          onChanged: widget.onChanged,
          style: TextStyle(color: themewhite, fontSize: 18),
          showCursor: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            icon: Icon(
              Icons.search,
              color: themewhite,
              size: 35,
            ),
            hintText: "SEARCH FOR SHOPS AND HOTELS",
            hintStyle: TextStyle(color: themedimwhite, fontSize: 14),
            focusColor: themewhite,
          ),
        ),
      ), //text inputbox container
      Divider(
        thickness: 7,
        color: themegreen,
      )
    ]);
  }
}
