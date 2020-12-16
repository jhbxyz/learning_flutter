import 'package:flutter/material.dart';

void main() async{
 await getJoke().then((value) {
    debugPrint("value = $value");
  }).catchError((error) {
    debugPrint('error = $error');
  });
  debugPrint('end.....');
}

Future<String> getJoke() {
  return Future.delayed(Duration(seconds: 2),(){
    return 'this is a joke ';
  });
}

//Future<String> getJoke() {
//  return Future<String>(() {
//    throw new Exception('No joke for you');
//    return 'this is a joke ';
//  });
//}

//Future<String> getJoke() {
//  return Future<String>(() {
//    return 'this is a joke ';
//  });
//}
