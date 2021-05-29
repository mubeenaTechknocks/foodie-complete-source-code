import 'package:flutter/material.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';

class CommonCard extends StatefulWidget {
  final String hotelname;
  final String location;
  final String mobile;

  const CommonCard({Key key, this.hotelname, this.location, this.mobile})
      : super(key: key);
  @override
  _CommonCardState createState() => _CommonCardState();
}

class _CommonCardState extends State<CommonCard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Card(
      color: themedimbalck,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20)),
      child: Container(
        height: height * .11,
        child: Stack(children: [
          Positioned(
            left: width * 0.03,
            top: height * 0.012,
            child: CircleAvatar(
              backgroundColor: themegreen,
              backgroundImage: AssetImage('images/call.png'),
              radius: 30,
            ),
          ),

          Positioned(
              left: width * 0.25,
              top: height * 0.02,
              child: Text(widget.hotelname,
                  style: TextStyle(
                      color: themewhite,
                      fontSize: 22,
                      fontWeight: FontWeight.w800))),

          Positioned(
              left: width * 0.25,
              top: height * 0.07,
              child: Text(widget.location,
                  style: TextStyle(
                    color: themewhite,
                    fontSize: 14,
                  ))),

          Positioned(
              left: width * 0.25,
              top: height * 0.05,
              child: Text(widget.mobile,
                  style: TextStyle(
                    color: themewhite,
                    fontSize: 14,
                  ))),

          // Positioned(
          // left: width*0.7,top:height*0.001,
          // child:IconButton(icon: Image.asset('images/edit.png',width:35,height: 35,),
          // onPressed: (){
          //    Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) {
          //           return EditDeliveryBoys();
          //         }),
          //       );
          // },
          // splashRadius: 1,)
          // ),
        ]),
      ),
    );
  }
}
