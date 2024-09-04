import 'dart:convert';
import 'dart:io';


import 'package:dio/dio.dart' as RESPONSE;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


var imageValue =File("").obs;

class RestApi {
  //Post api without authentication
  Future<http.Response> postApi(String url,  request,) async {
    var response = await http.post(Uri.parse(url), body: request,
        headers: {
      "content-type": "application/x-www-form-urlencoded",
      "accept": "*/*",
    },
        encoding: Encoding.getByName("utf-8"));
    return response;
  }
}




