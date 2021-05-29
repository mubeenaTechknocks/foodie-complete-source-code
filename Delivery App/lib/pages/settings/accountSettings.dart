import 'package:flutter/material.dart';
import 'package:foodie_delivery/animations/enterExitAniation.dart';
import 'package:foodie_delivery/models/usermodel.dart';
import 'package:foodie_delivery/pages/settings/accountManagement.dart';
import 'package:foodie_delivery/pages/settings/personalInformationS.dart.dart';
import 'package:foodie_delivery/pages/settings/vehicleDetailS.dart';
import 'package:foodie_delivery/pages/settings/wallet.dart';
import 'package:foodie_delivery/services/getUserDetails.dart';
import 'package:foodie_delivery/services/sharedPreference.dart';
import 'package:foodie_delivery/setting.dart';
import 'package:foodie_delivery/widgets/appbar.dart';
import 'package:foodie_delivery/widgets/greyLine.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String email = '';
  @override
  void initState() {
    super.initState();
    getStringValue(key: 'email').then((value) {
      setState(() {
        email = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: FoodieAppbar(
          isSettings: true,
        ),
        body: email == ''
            ? Center(child: CircularProgressIndicator())
            : FutureBuilder(
                future: getUserDetails(email),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    UserModel user = snapshot.data;
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            width: double.maxFinite,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  alignment: Alignment.bottomRight,
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey[400], width: 5),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(profile),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Text(
                                  user.personalInformations.name,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22),
                                ),
                                Divider(
                                  color: Colors.white,
                                ),
                                // Text(
                                //   'ID: TCR 1281',
                                //   style: TextStyle(
                                //       color: Colors.grey[800], fontSize: 16),
                                // ),
                                GreyLine(),
                                SettingsCard(
                                  icon: Icons.person_rounded,
                                  text: 'Personal Informations',
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        EnterExitRoute(
                                          exitPage: Account(),
                                          enterPage: PersonalInformationS(
                                            user: user,
                                          ),
                                        ));
                                  },
                                ),
                                SettingsCard(
                                  icon: Icons.account_balance_wallet,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        EnterExitRoute(
                                          exitPage: Account(),
                                          enterPage: Wallet(),
                                        ));
                                  },
                                  text: 'Wallet',
                                ),
                                SettingsCard(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        EnterExitRoute(
                                          exitPage: Account(),
                                          enterPage: VehicleDetailS(
                                            user: user,
                                          ),
                                        ));
                                  },
                                  icon: Icons.two_wheeler_sharp,
                                  text: 'Vehicle Details',
                                ),
                                SettingsCard(
                                  icon: Icons.settings_rounded,
                                  text: 'Account Management',
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        EnterExitRoute(
                                          exitPage: Account(),
                                          enterPage: AccountManagement(),
                                        ));
                                  },
                                ),
                                SettingsCard(
                                  icon: Icons.quick_contacts_mail,
                                  text: 'Support',
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }));
  }
}

class SettingsCard extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final IconData icon;

  const SettingsCard({Key key, this.text, this.onPressed, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(20),
          width: double.maxFinite,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.black,
                  ),
                  VerticalDivider(),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
