// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/functions/checkinternet.dart';
import 'Staterequest.dart';
import 'package:http/http.dart' as http;

//35
class Crud {
  Future<Either<StateRequest, Map>> postData(String url, Map data) async {
    try {
      if (await checkInternet()) // checkInternet() => true
      {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print("=========vv============$responsebody");
          return Right(responsebody);
        } else {
          return const Left(StateRequest.serverfailure);
        }
      } else {
        return const Left(StateRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StateRequest.serverException);
    }
  }
}
