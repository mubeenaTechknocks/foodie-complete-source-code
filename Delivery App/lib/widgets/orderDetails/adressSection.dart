import 'package:flutter/material.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/greyLine.dart';
import 'package:foodie_delivery/widgets/roundButton.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:maps_launcher/maps_launcher.dart';

class AdressSection extends StatelessWidget {
  final String adresstitle;
  final String address;
  final double latitude;
  final double longitude;
  final int phone;

  const AdressSection(
      {Key key,
      this.adresstitle = '',
      this.address,
      this.latitude,
      this.longitude,
      this.phone})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // GreyLine(),
          Text(
            adresstitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          Text(
            '\n$address',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              border: Border.all(color: themegreen, width: 2),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RoundButton(
                    splashColor: Colors.red,
                    icon: Icons.location_on,
                    iconColor: Colors.red,
                    onPressed: () {
                      MapsLauncher.launchCoordinates(latitude, longitude);
                      print('GOOGLE MAP');
                    },
                  ),
                  RoundButton(
                    splashColor: themegreen,
                    icon: Icons.phone,
                    iconColor: themegreenlight,
                    onPressed: () {
                      UrlLauncher.launch("tel://$phone");
                      print('PHONE CALL');
                    },
                  ),
                ]),
          ),
          Divider(
            color: Colors.white,
          ),
          GreyLine(),
        ],
      ),
    );
  }
}
