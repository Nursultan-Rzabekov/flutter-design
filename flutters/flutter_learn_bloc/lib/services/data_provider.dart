import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_learn_bloc/models/user.dart';
import 'package:flutter_learn_bloc/services/rest/rest_client.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  static const int _perPage = 10;
  static final dio = Dio();
  final client = RestClient(dio);

  // Future<List<User>> getUsersList() async {
  //   final response =
  //       await http.get('http://jsonplaceholder.typicode.com/users');

  //   if (response.statusCode == 200) {
  //     final List<dynamic> userJson = json.decode(response.body);
  //     return userJson.map((json) => User.fromJson(json)).toList();
  //   } else {
  //     throw Exception('Error fetching users');
  //   }
  // }

  Future<List<User>> getUsersList() async {
    return client.getUsers().then((it) {}).catchError((Object obj) {
      //non-200 error goes here.
      switch (obj.runtimeType) {
        case DioError:
          // Here's the sample to get the failed response error code and message
          final res = (obj as DioError).response;
          print("Got error : ${res.statusCode} -> ${res.statusMessage}");
          break;
        default:
      }
    });
  }

  Future<dynamic> getBeers({
    @required int page,
  }) async {
    try {
      return await http.get(
        'https://api.punkapi.com/v2/beers?page=$page&per_page=$_perPage',
      );
    } catch (e) {
      return e.toString();
    }
  }
}
