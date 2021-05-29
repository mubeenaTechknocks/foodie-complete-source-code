import 'package:flutter/material.dart';
import 'package:foodieadmin/goldPages/subAdminDetails.dart';
import 'package:foodieadmin/goldWidgets/appbar.dart';
import 'package:foodieadmin/goldWidgets/goldSetting.dart';
import 'package:foodieadmin/goldWidgets/orderCard.dart';
import 'package:foodieadmin/goldWidgets/title.dart';
import 'package:foodieadmin/model/subadminmodels.dart';
import 'package:foodieadmin/services/getsubadmin.dart';

class AdminAccounts extends StatefulWidget {
  
  @override
  _AdminAccountsState createState() => _AdminAccountsState();
}

class _AdminAccountsState extends State<AdminAccounts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themecolor,
        appBar: FoodieAppbar(),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              FoodieTitle(title: "SubAdmin List"),
              SizedBox(height: 20),
              Expanded(
                child:FutureBuilder(
              future: getdata(),
                          builder:(context,snapShot){
                            if(snapShot.hasData){
                            return ListView.builder(
                    itemCount: snapShot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Subadminals subadmin = snapShot.data[index];
                      return OrderCard(
                        hotelName: subadmin.name ?? '',
                        orderAmount: '',
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => SubAdminDetails(subadmin:subadmin,)));
                        },
                      );
                    });}else if(snapShot.hasError){
                      return Center(child:Text('Loading Failed'));
                     } else {
                return Center(child: CircularProgressIndicator(),);
                    }}
              ),
            )],
          ),
        )));
  }
}