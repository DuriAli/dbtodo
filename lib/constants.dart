import 'package:dbtodo/services/db_helper_functions.dart';
import 'package:flutter/material.dart';

import 'models/task.dart';

const Color kPrimaryBlue = Color(0xFF2C3D44);
const Color kPrimaryWhite = Color(0xFFFDFDFE);
const Color kPrimaryTextColor = Color(0xFF001D2A);
const Color kPrimaryAccentColor = Color(0xFFB65A51);
const Color kSecondaryAccentColor = Color(0xFF5799A2);
const Color kSecondaryWhite = Color(0xFFF1F1F5);

class CConst {
  static int baseID = 0;
}

// class User {
//   int userID;
//   int userPW;
//   String userName;

//   List<Task> tasks;

//   User(this.userName, this.userPW) {
//     userID = CConst.baseID;
//     CConst.baseID++;
//     tasks = <Task>[];
//   }

//   Map<String, dynamic> toMap() {
//     var map = <String, dynamic>{
//       'userID': userID,
//       'userPW': userPW,
//       'userName': userName,
//     };
//     return map;
//   }

//   User.fromMap(Map<String, dynamic> map) {
//     String cuserID = (map['userID']);
//     String cuserPW = (map['userPW']);
//     userName = map['userName'];

//     this.userID = int.parse(cuserID);
//     this.userPW = int.parse(cuserPW);
//   }

//   User.fromJson(Map<String, dynamic> json){
//     this.userID = json[DBHelper2.USERID];
//     this.userPW = json[DBHelper2.USERPW];
//     this.userName = json[DBHelper2.USERNAME];
//   }
// }

TextStyle kLogoTextStyle = TextStyle(
    fontSize: 80,
    fontWeight: FontWeight.bold,
    color: kPrimaryTextColor,
    fontFamily: 'Roboto');
