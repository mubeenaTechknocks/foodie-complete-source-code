import 'package:flutter/material.dart';
import 'package:foodieshop/goldWidgets/goldSetting.dart';

class UnitList extends StatefulWidget {
  @override
  _UnitListState createState() => _UnitListState();
}

class _UnitListState extends State<UnitList> {
  String dropdownValue = 'kg';
  @override
  Widget build(BuildContext context) {
    

    return DropdownButton<String>(
      value: dropdownValue,
      dropdownColor: themedimbalck,
      icon: Image.asset('images/arrowdown.png',width: 35,height: 35,),
      iconSize: 24,
      elevation: 16,
      
      style: TextStyle(color: themewhite,fontSize: 22),
      underline: Container(
        height: 0.1,
        color: themegreen,
      ),
      
   
  
      
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['kg', 'No.', 'gm', 'L']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),       
        );
      }).toList(),
    );
  }
}