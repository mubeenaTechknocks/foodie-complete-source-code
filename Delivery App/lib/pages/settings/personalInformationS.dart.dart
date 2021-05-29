import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie_delivery/models/usermodel.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/appbar.dart';

class PersonalInformationS extends StatefulWidget {
  final UserModel user;

  const PersonalInformationS({Key key, this.user}) : super(key: key);
  @override
  _PersonalInformationSState createState() => _PersonalInformationSState();
}

class _PersonalInformationSState extends State<PersonalInformationS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushReplacement(context,
      //         MaterialPageRoute(builder: (context) {
      //       return FirstFormFill(
      //         user: widget.user,
      //         isEdit: true,
      //       );
      //     }));
      //   },
      //   child: Icon(Icons.edit),
      //   backgroundColor: themegreen,
      // ),
      backgroundColor: themecolor,
      appBar: FoodieAppbar(
        isSettings: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Personal Informations',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  //TODO: Change Profile Picture
                },
                child: Row(
                  children: [
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(profile), fit: BoxFit.fill)),
                    ),
                  ],
                ),
              ),
              TextContainer(
                text: widget.user.personalInformations.name,
              ),
              TextContainer(
                isMultiLine: true,
                text:
                    widget.user.personalInformations.address.houseName +
                      "\n" +
                      widget.user.personalInformations.address.postOffice +
                      "\n" +
                      widget.user.personalInformations.address.city +
                      "\nPostal Code : " +
                      widget.user.personalInformations.address.pincode 
              ),
              TextContainer(
                text: 'Age: ' + widget.user.personalInformations.age,
              ),
              TextContainer(
                text: 'Phone: ' + widget.user.personalInformations.phone,
              ),
              TextContainer(
                text: 'Blood Group: ' +
                    widget.user.personalInformations.bloodGroup,
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  final String text;
  final bool isMultiLine;
  final double height;

  const TextContainer({
    Key key,
    this.text,
    this.isMultiLine = false,
    this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(color: Colors.grey[300]),
      padding: EdgeInsets.all(10),
      // color: Colors.red,
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(fontSize: 17),
      ),
      height: isMultiLine ? null : 50,
    );
  }
}
