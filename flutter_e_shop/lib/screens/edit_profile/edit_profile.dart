import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_e_shop/constants/constant.dart';
import 'package:flutter_e_shop/firebase_helper/firebase_storage_helper/firebase_storage_helper.dart';
import 'package:flutter_e_shop/models/user_model/user_model.dart';
import 'package:flutter_e_shop/provider/app_provider.dart';
import 'package:flutter_e_shop/widgets/primary_button/primary_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;
  void takePicture() async {
    XFile? value = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 40);
    if (value != null) {
      setState(() {
        image = File(value.path);
      });
    }
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        children: [
          image == null
              ? CupertinoButton(
                  onPressed: () {
                    takePicture();
                  },
                  child: CircleAvatar(
                    radius: 55,
                    child: Icon(Icons.camera_alt),
                  ),
                )
              : CupertinoButton(
                  onPressed: () {
                    takePicture();
                  },
                  child: CircleAvatar(
                    backgroundImage: FileImage(image!),
                    radius: 55,
                  ),
                ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: textEditingController,
            decoration:
                InputDecoration(hintText: appProvider.getUserInformation.name),
          ),
          SizedBox(
            height: 12,
          ),
          PrimaryButton(
            title: "Update",
            onPressed: () async {
              UserModel userModel = appProvider.getUserInformation
                  .copyWith(name: textEditingController.text);
              appProvider.updateUserInfoFirebase(context, userModel, image);
            },
          )
        ],
      ),
    );
  }
}
