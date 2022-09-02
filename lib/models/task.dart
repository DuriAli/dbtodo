import 'package:dbtodo/widgets/rounded_tile_card.dart';
import 'package:flutter/material.dart';

class Task {
  String id;
  int valueID;
  String text;
  bool isDone;

  Task(String ctext, this.valueID) {
    text = ctext;
    isDone = false;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      '_id': id,
      'valueID': valueID,
      'strText': text,
      'isDone': isDone,
    };
    return map;
  }

  Task.fromMap(Map<String, dynamic> map) {
    id = (map['_id']);
    valueID = map['valueID'];
    text = map['strText'];
    isDone = map['isDone'];
  }

  convertToTile() {
    RoundedTileCard();
  }
}
