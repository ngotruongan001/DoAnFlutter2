import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_control/constants/theme_data.dart';
import 'package:smart_control/models/user_model.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

//url: https://server-flutter2-ktm.herokuapp.com/

Future<UserModel?> createUser(String description ) async{
  final String apiUrl = "https://server-flutter2-ktm.herokuapp.com/v1/api/message/create";

  final response = await http.post(apiUrl, body: {
    "description": description,
  });

  if(response.statusCode == 200){
    final String responseString = response.body;

    return userModelFromJson(responseString);
  }else{
    return null;
  }
}

class _ReportPageState extends State<ReportPage> {
  final myController = TextEditingController();

  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report"),
        backgroundColor: CustomColors.menuBackgroundColor,
      ),
      backgroundColor: CustomColors.pageBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
       
      ),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}