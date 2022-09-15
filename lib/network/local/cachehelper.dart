import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CahceHelper {
  static   SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static Future<bool> PutData({
    required String? Key,
    required bool? Value,
  }) async{
     return await sharedPreferences!.setBool(Key!, Value!);
  }
  static bool? getData({
    required String? Key,
  }) {
    return sharedPreferences!.getBool(Key!);
  }


}
