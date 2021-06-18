import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodieshop/goldPages/admin.dart';
import 'package:foodieshop/goldWidgets/appbar.dart';
import 'package:foodieshop/goldWidgets/goldSetting.dart';
import 'package:foodieshop/services/upload_product_image.dart';
import 'package:image_picker/image_picker.dart';

class UploadProductImage extends StatefulWidget {
  final String productId;
  const UploadProductImage({Key key, this.productId}) : super(key: key);

  @override
  _UploadProductImageState createState() => _UploadProductImageState();
}

class _UploadProductImageState extends State<UploadProductImage> {
  bool _loading = false;
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FoodieAppbar(),
      backgroundColor: themecolor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 18),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.grey,
                child: _image == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              iconSize: 50,
                              onPressed: () {
                                getImage();
                              },
                              icon: Icon(Icons.add_a_photo_outlined)),
                          Text('Add a photo of the product')
                        ],
                      )
                    : Image.file(
                        _image,
                        fit: BoxFit.fill,
                      )),
            SizedBox(
              height: 20,
            ),
            _loading
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(themegreen),
                  )
                : MaterialButton(
                    onPressed: _image == null
                        ? null
                        : () {
                            setState(() {
                              _loading = true;
                            });
                            uploadProductImage(_image.path, widget.productId)
                                .then((value) {
                              if (value) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (_) => Admin()),
                                    (route) => false);
                              } else {
                                SnackBar snackBar = SnackBar(
                                    content: Text(
                                        'Can not upload image. Try again.'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                setState(() {
                                  _loading = false;
                                });
                              }
                            });
                          },
                    color: themegreen,
                    disabledColor: Colors.grey,
                    minWidth: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    child: Text(
                      'UPLOAD',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
