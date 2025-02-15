import 'dart:convert';
import 'dart:io';

import 'package:quick_dine/constant.dart';
import 'package:quick_dine/models/api_response.dart';
import 'package:quick_dine/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<ApiResponse> login(String email, String password) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(loginURL),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password});
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)[0]];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> register(String name, String email, String password, String notelp, String role) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(registerURL),
        headers: {'Accept': 'application/json'},
        body: {
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': password,
          'notelp': notelp,
          'role': role
        });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)[0]];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

Future<ApiResponse> getUser() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token=await getToken();
    final response = await http.get(Uri.parse(userURL),
        headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'});
    switch (response.statusCode) {
      case 200:
        apiResponse.data = User.fromJson(jsonDecode(response.body));
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)[0]];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      default:
        apiResponse.error = somethingWentWrong;
        break;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }
  return apiResponse;
}

//retreive user token from shared pref
Future <String> getToken() async{
  SharedPreferences pref=await SharedPreferences.getInstance();
  return pref.getString('token')??'';
}

Future <int> getUserId() async{
  SharedPreferences pref=await SharedPreferences.getInstance();
  return pref.getInt('idUser') ?? 0;
}

//hapus token dari shared pref
Future <bool> logout() async{
  SharedPreferences pref=await SharedPreferences.getInstance();
  return await pref.remove('token');
}

//get base64 encoded image
String? getStringImage(File? file){
  if(file==null)return null;
  return base64Encode(file.readAsBytesSync());
}


