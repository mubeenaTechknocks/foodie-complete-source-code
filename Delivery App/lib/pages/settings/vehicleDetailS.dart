import 'package:flutter/material.dart';
import 'package:foodie_delivery/models/usermodel.dart';
import 'package:foodie_delivery/pages/settings/personalInformationS.dart.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/appbar.dart';

class VehicleDetailS extends StatefulWidget {
  final UserModel user;

  const VehicleDetailS({Key key, this.user}) : super(key: key);
  @override
  _VehicleDetailSState createState() => _VehicleDetailSState();
}

class _VehicleDetailSState extends State<VehicleDetailS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushReplacement(context,
      //         MaterialPageRoute(builder: (context) {
      //       return VechicleDetails(
      //         isEdit: true,
      //         user: widget.user,
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
                'Vehicle Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextContainer(
                text: 'Licence No: ' + widget.user.vehicleDetails.licenceNo,
              ),
              TextContainer(
                  text: 'Vechicle Model: ' +
                      widget.user.vehicleDetails.vehicleModel),
              TextContainer(
                text: 'Vechicle Colour: ' +
                    widget.user.vehicleDetails.vehicleColor,
              ),
              TextContainer(
                text: 'Reg.No: ' + widget.user.vehicleDetails.regNo,
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
