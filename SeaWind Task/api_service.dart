import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  String url = "https://reqres.in/api/users";

// For all user data

  Future<dynamic> getData() async {
    try {
      var response = await _dio.get(url);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      // print("Error:- $e");
    }
  }

// For individual data

  Future<dynamic> getUserData(int id) async {
    try {
      var response = await _dio.get(url + "/$id");

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      // print("Error:- $e");
    }
  }

  // For sending Data

  Future<dynamic> postData(String name, String job) async {
    var body = {'name': name, 'job': job};
    try {
      var response = await _dio.post(url, data: body);
      // print("============$response");
      if (response.statusCode == 201) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      // print("=============$e");
    }
  }
}
