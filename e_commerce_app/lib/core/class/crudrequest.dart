
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {

  Future <Either< StatusRequest , Map>> postData(String linkurl, Map data) async {
 try {
   
    if(await checkInternet()){
 var response = await http.post(Uri.parse(linkurl) , body:  data);
 if(response.statusCode == 200 || response.statusCode == 201 ){
  Map Responsebody = jsonDecode(response.body);
  return Right(Responsebody);
 }
 else{
  return const Left(StatusRequest.serverfailure);
 }
 }
 else{
    return const Left(StatusRequest.offlinefailure);
  }
 } catch (_) {
   return const Left(StatusRequest.serverException);

 }
}
}