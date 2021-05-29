import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodieadmin/goldPages/accounts.dart';
import 'package:foodieadmin/goldWidgets/appbar.dart';
import 'package:foodieadmin/goldWidgets/colorButton.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/textBox.dart';
import 'package:foodieadmin/services/deletesubadmindata.dart';
import 'package:foodieadmin/model/subadminmodels.dart';
import 'package:foodieadmin/services/editsubadmin.dart';


class SubAdminDetails extends StatefulWidget {
final Subadminals subadmin;



    const SubAdminDetails ({Key key, this.subadmin}) : super(key: key);

  
  @override
  _SubAdminDetailsState createState() => _SubAdminDetailsState();
}

class _SubAdminDetailsState extends State<SubAdminDetails> {
  // Future<Subadminals> _response;
  String name;
  String contactNumber;
  String pincode;
  String address;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.of(context).size.width;

    Future<void> _showMyDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: themecolor,
            title: Text(
              'Delete SubAdmin ?',
              style: commonTextStyle,
            ),
            content: SingleChildScrollView(
              child: 
              ListBody(
                children: <Widget>[
                  Text(
                    'Would you like to delete this SubAdmin',
                    style: commonTextStyle,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              ColorButton(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                buttonColor: themegreen,
                buttonText: ('No'),
                buttonAction: () {
                  Navigator.of(context).pop();
                },
              ),
              ColorButton(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  buttonColor: Colors.red,
                  buttonText: ('Yes'),
                  buttonAction: () {
                  deletesubadmindata(widget.subadmin.id).then((value) {
                          if (value == true) {
                            setState(() {});
                          } else {
                            print('Delete Failed');
                          }
                        });
                  Navigator.pop(context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => AdminAccounts()));
                  }),
                   ],
                    );
                     },
                   );
      }
                   return Scaffold(
                    backgroundColor: themecolor,
                   appBar: FoodieAppbar(),
                  body: SingleChildScrollView(
                   child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                  child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                  'Edit SubAdmin Account',
                  style: commonTextStyle,
                  ),
                  TextBox(
                  margin: EdgeInsets.only(top: 25, bottom: 15),
                  hintText: 'Name',
                  initialvalue: widget.subadmin.name,
                  
                onChanged: (value){
                  setState(() {
                    name=value;
                  });
                },
                
                 
                  ),
                  TextBox(
                  hintText: 'Mobile Number',
                  initialvalue: widget.subadmin.contactnumber,
                   onChanged: (value){
                  setState(() {
                    contactNumber=value;
                  });
                },
                  
                 
                  ),
                  TextBox(
                  height: 90,
                  hintText: 'SubAdmin\'s Address',
                  maxLines: 5,
                  initialvalue: widget.subadmin.address,
                  onChanged: (value){
                  setState(() {
                    address=value;
                  });
                },
                  
                 
                  ),
                  TextBox(
                  hintText: 'pincode',
                  initialvalue: widget.subadmin.pincode.toString(),
                  onChanged: (value){
                  setState(() {
                    pincode=value;
                  });
                },
                  
                 
                  ),
                  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Divider(
                  color: themegreen,
                  thickness: 3,
                  ),
                  ),
                  TextBox(
                  hintText: 'Email of SubAdmin',
                  initialvalue: widget.subadmin.email,
                   onChanged: (value){
                  setState(() {
                    email=value;
                  });
                },
                 
                  ),
                  TextBox(
                  hintText: 'Password for SubAdmin',
                 onChanged: (value){
                  setState(() {
                    password=value;
                  });
                },
                  
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                  width: double.maxFinite,
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Expanded(
                  flex: 1,
                  child: ColorButton(
                  buttonAction: () {
                  _showMyDialog();
                  },
                  buttonColor: Colors.red,
                  buttonText: 'DELETE',
                  padding: wt > 400
                  ? EdgeInsets.symmetric(
                  horizontal: 45, vertical: 20)
                  : EdgeInsets.symmetric(
                    horizontal: 23, vertical: 16),
                    ),
                    ),
                  Expanded(
                  flex: 1,
                  child: ColorButton(
                  buttonAction: () {
                  editsubadmin(name, widget.subadmin.id).then((value) {
                  if (value == true) {
                    print("updated");
                   
                  Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                  builder: (context) => AdminAccounts()));
                    } else {
                    print("update failed");
                  }          
                  });
                  },
                  buttonColor: themegreen,
                  buttonText: 'UPDATE',
                  padding: wt > 400
                  ? EdgeInsets.symmetric(
                  horizontal: 45, vertical: 20)
                : EdgeInsets.symmetric(
                horizontal: 23, vertical: 16),
                ),
                ),
                ],
              ),
            )
            ],
          ),
        ),
      ),
    ),
   );
  }
 }
 
            