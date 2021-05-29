import 'package:flutter/material.dart';
import 'package:foodie_delivery/models/usermodel.dart';
import 'package:foodie_delivery/pages/firstFormFill.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/LoginPage/commonbutton.dart';
import 'package:foodie_delivery/widgets/LoginPage/passwordfield.dart';
import 'package:foodie_delivery/widgets/LoginPage/textBoxNew.dart';

class SignupCredentials extends StatefulWidget {
  @override
  _SignupCredentialsState createState() => _SignupCredentialsState();
}

class _SignupCredentialsState extends State<SignupCredentials> {
  UserModel user = UserModel();
  PersonalInformations personalInformations = PersonalInformations();
  Address address = Address();
  VehicleDetails vehicleDetails = VehicleDetails();


  @override
  Widget build(BuildContext context) {
    user.personalInformations = personalInformations;
    user.personalInformations.address = address;
    user.vehicleDetails = vehicleDetails;

    return Scaffold(
      backgroundColor: themecolor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 45),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 200)),
                      TitleText(
                        title: "Register",
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      TextBoxNew(
                        hint: "Enter Email ",
                        onChanged: (value) {
                          setState(() {
                            user.email = value;
                          });
                        },
                      ),
                      PasswordField(
                        onChanged: (value) {
                          setState(() {
                            user.password = value;
                          });
                        },
                        hint: "Choose Password",
                      ),
                      PasswordField(hint: "Confirm Password"),
                      Padding(padding: EdgeInsets.only(top: 40)),
                      CommonButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return FirstFormFill(
                              userRegistration: user,
                            );
                          }));
                        },
                        title: "Next",
                      )
                    ])),
          ]),
        ),
      ),
    );
  }
}
