import 'package:flutter/material.dart';
import 'package:foodie_delivery/models/usermodel.dart';
import 'package:foodie_delivery/pages/agreement.dart';
import 'package:foodie_delivery/pages/settings/accountSettings.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/LoginPage/commonbutton.dart';
import 'package:foodie_delivery/widgets/LoginPage/textBoxNew.dart';

class VechicleDetails extends StatefulWidget {
  final bool isEdit;
  final UserModel user;
  final UserModel userRegistration;

  const VechicleDetails(
      {Key key, this.isEdit = false, this.user, this.userRegistration})
      : super(key: key);
  @override
  _VechicleDetailsState createState() => _VechicleDetailsState();
}

class _VechicleDetailsState extends State<VechicleDetails> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themecolor,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 45),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TitleText(
                          title: "Vechicle Details",
                        ),
                        Padding(padding: EdgeInsets.only(top: 20)),
                        TextBoxNew(
                            onChanged: (value) {
                              setState(() {
                                widget.userRegistration.vehicleDetails
                                    .licenceNo = value;
                              });
                            },
                            hint: "Licence No.",
                            initialvalue: widget.isEdit
                                ? widget.user.vehicleDetails.licenceNo
                                : null),
                        TextBoxNew(
                          onChanged: (value) {
                            setState(() {
                              widget.userRegistration.vehicleDetails
                                  .vehicleModel = value;
                            });
                          },
                          hint: "Vechicle Model",
                          initialvalue: widget.isEdit
                              ? widget.user.vehicleDetails.vehicleModel
                              : null,
                        ),
                        TextBoxNew(
                            onChanged: (value) {
                              setState(() {
                                widget.userRegistration.vehicleDetails
                                    .vehicleColor = value;
                              });
                            },
                            hint: "Vechicle Colour",
                            initialvalue: widget.isEdit
                                ? widget.user.vehicleDetails.vehicleColor
                                : null),
                        TextBoxNew(
                            onChanged: (value) {
                              setState(() {
                                widget.userRegistration.vehicleDetails.regNo =
                                    value;
                              });
                            },
                            hint: "Registration Number",
                            initialvalue: widget.isEdit
                                ? widget.user.vehicleDetails.regNo
                                : null),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        widget.isEdit
                            ? CommonButton(
                                //Button if it is editing
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
                                  if (_formKey.currentState.validate()) {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return Agreement(
                                        user: widget.userRegistration,
                                      );
                                    }));
                                  }
                                },
                                title: "Next",
                              )
                      ]),
                )),
          ]),
        ),
      ),
    );
  }
}
