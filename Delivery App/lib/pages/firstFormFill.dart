import 'package:flutter/material.dart';
import 'package:foodie_delivery/models/usermodel.dart';
import 'package:foodie_delivery/pages/settings/accountSettings.dart';
import 'package:foodie_delivery/pages/vechileDetails.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/LoginPage/commonbutton.dart';
import 'package:foodie_delivery/widgets/LoginPage/textBoxNew.dart';

class FirstFormFill extends StatefulWidget {
  final bool isEdit;
  final UserModel user;
  final UserModel userRegistration;

  const FirstFormFill({
    Key key,
    this.isEdit = false,
    this.user,
    this.userRegistration,
  }) : super(key: key);
  @override
  _FirstFormFillState createState() => _FirstFormFillState();
}

class _FirstFormFillState extends State<FirstFormFill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themecolor,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleText(
                      title: "Personal Details",
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    TextBoxNew(
                        onChanged: (value) {
                          setState(() {
                            widget.userRegistration.personalInformations.name =
                                value;
                          });
                        },
                        hint: "Name",
                        initialvalue: widget.isEdit
                            ? widget.user.personalInformations.name
                            : null),
                    TextBoxNew(
                        onChanged: (value) {
                          setState(() {
                            widget.userRegistration.personalInformations.address
                                .houseName = value;
                          });
                        },
                        hint: "House Name",
                        initialvalue: widget.isEdit
                            ? widget.user.personalInformations.address.houseName
                            : null),
                    TextBoxNew(
                        onChanged: (value) {
                          setState(() {
                            widget.userRegistration.personalInformations.address
                                .postOffice = value;
                          });
                        },
                        hint: "Post Office",
                        initialvalue: widget.isEdit
                            ? widget
                                .user.personalInformations.address.postOffice
                            : null),
                    TextBoxNew(
                        onChanged: (value) {
                          setState(() {
                            widget.userRegistration.personalInformations.address
                                .city = value;
                          });
                        },
                        hint: "City",
                        initialvalue: widget.isEdit
                            ? widget.user.personalInformations.address.city
                            : null),
                    TextBoxNew(
                        onChanged: (value) {
                          setState(() {
                            widget.userRegistration.personalInformations.address
                                .pincode = value;
                          });
                        },
                        hint: "Postal Code",
                        initialvalue: widget.isEdit
                            ? widget.user.personalInformations.address.pincode
                            : null),
                    TextBoxNew(
                        onChanged: (value) {
                          setState(() {
                            widget.userRegistration.personalInformations.age =
                                value;
                          });
                        },
                        hint: "Age",
                        initialvalue: widget.isEdit
                            ? widget.user.personalInformations.age
                            : null),
                    TextBoxNew(
                        onChanged: (value) {
                          setState(() {
                            widget.userRegistration.personalInformations.phone =
                                value;
                          });
                        },
                        hint: "Phone",
                        initialvalue: widget.isEdit
                            ? widget.user.personalInformations.phone
                            : null),
                    TextBoxNew(
                        onChanged: (value) {
                          setState(() {
                            widget.userRegistration.personalInformations
                                .bloodGroup = value;
                          });
                        },
                        hint: "Blood Group",
                        initialvalue: widget.isEdit
                            ? widget.user.personalInformations.bloodGroup
                            : null),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    widget.isEdit
                        ? CommonButton(
                            //Button if it is editing
                            //TODO:Save editing
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return Account();
                              }));
                            },
                            title: "Save",
                          )
                        : CommonButton(
                            //Button if it is registration
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return VechicleDetails(
                                  userRegistration: widget.userRegistration,
                                );
                              }));
                            },
                            title: "Next",
                          )
                  ])),
        ]),
      ),
    );
  }
}
