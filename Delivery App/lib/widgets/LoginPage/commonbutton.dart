import 'package:flutter/material.dart';
import 'package:foodie_delivery/setting.dart';

class CommonButton extends StatelessWidget {
  
  final String title;
  final void Function() onPressed;

  const CommonButton({Key key, this.title, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return MaterialButton(
      height: 60,
      minWidth: width,
      highlightColor: Colors.green,
      color: Colors.green[400],
      onPressed: onPressed,
      // onPressed: (){
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
      //   return pagetogo;
      // }));
      // },
      child: Text(
        "$title",
        style: TextStyle(color: themecolor, fontSize: 18),
      ),
    );
  }
}
