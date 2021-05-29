import 'package:flutter/material.dart';
import 'package:foodieadmin/goldPages/setting.dart';
import 'package:foodieadmin/goldWidgets/appbar.dart';
import 'package:foodieadmin/goldWidgets/colorButton.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/textBox.dart';
import 'package:foodieadmin/services/postsubadmins.dart';
import '../model/subadminmodels.dart';

class SubAdmin extends StatefulWidget {
  @override
  _SubAdminState createState() => _SubAdminState();
}

class _SubAdminState extends State<SubAdmin> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _contactnumberController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Future<Subadminals> _response;

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
              'Discard Changes ?',
              style: commonTextStyle,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(
                    'Would you like to discard all changes',
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
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => Settings()));
                  }),
            ],
          );
        },
      );
    }

    return Scaffold(
        backgroundColor: themecolor,
        appBar: FoodieAppbar(),
        body: (_response == null)
            ? SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 20, left: 25, right: 25),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create SubAdmin Account',
                          style: commonTextStyle,
                        ),
                        TextBox(
                          margin: EdgeInsets.only(top: 25, bottom: 15),
                          hintText: 'Name',
                          controller: _nameController,
                        ),
                        TextBox(
                          hintText: 'Mobile Number',
                          controller: _contactnumberController,
                        ),
                        TextBox(
                          height: 90,
                          hintText: 'SubAdmin\'s Address',
                          controller: _addressController,
                          maxLines: 5,
                        ),
                        TextBox(
                          hintText: 'pincode',
                          controller: _pincodeController,
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
                          controller: _emailController,
                        ),
                        TextBox(
                          hintText: 'Password for SubAdmin',
                          controller: _passwordController,
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
                                  buttonText: 'CANCEL',
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
                                    print(_addressController.text);
                                    setState(() {
                                      _response = postdata(
                                        name: _nameController.text,
                                        contactnumber:
                                            _contactnumberController.text,
                                        address: _addressController.text,
                                        pincode:
                                            _pincodeController.text.toString(),
                                        email: _emailController.text.toString(),
                                        password:
                                            _passwordController.text.toString(),
                                      );
                                    });
                                  },
                                  // ignore: todo
                                  //TODO: Add new admin to the database !!!!

                                  buttonColor: themegreen,
                                  buttonText: 'CREATE',
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
              )
            : FutureBuilder<Subadminals>(
                future: _response,
                builder: (context, snap) {
                  if (snap.hasData) {
                    Subadminals subadmin = snap.data;
                    print(snap.data.name);
                    return Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                             subadmin.name == null
                              ? SizedBox()
                              : Text(
                                  subadmin.name,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 23),
                                ),
                          Text(
                            subadmin.name == null
                                ? 'Failed to add subadmin'
                                : 'Saved successfully',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          MaterialButton(
                              child: Text('Back'),
                              color: themegreen,
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Settings();
                                }));
                              }
                        
                      ),
                         ]));
                  } else if (snap.hasError) {
                    return Center(
                      child: Text('Error'),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ));
  }
}
