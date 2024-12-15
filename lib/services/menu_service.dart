import 'dart:convert';

import 'package:quick_dine/constant.dart';
import 'package:quick_dine/models/api_response.dart';
import 'package:quick_dine/models/menu.dart';
import 'package:http/http.dart' as http;
import 'package:quick_dine/services/user_service.dart';

Future<ApiResponse> getMenu(int idKantin) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse('$kantinURL/$idKantin/menu'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['menu']
            .map((m) => Menu.fromJson(m))
            .toList();
        //(list menu) item ke model
        apiResponse.data as List<dynamic>;
        break;
      case 401:
        apiResponse.error = unauthorized;
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

Future<ApiResponse> addMenu(String namaMenu, String deskripsi, int harga,
    int stok, int idKantin, String? image) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.post(Uri.parse('$kantinURL/$idKantin/menu'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: image != null
            ? {
                'nama_menu': namaMenu,
                'deskripsi': deskripsi,
                'harga': harga.toString(),
                'stok': stok.toString(),
                'id_kantin': idKantin.toString(),
                'image': image
              }
            : {
                //klo image gada,
                'nama_menu': namaMenu,
                'deskripsi': deskripsi,
                'harga': harga.toString(),
                'stok': stok.toString(),
                'id_kantin': idKantin.toString(),
              });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body);
        break;
      case 422:
        final errors = jsonDecode(response.body)['errors'];
        apiResponse.error = errors[errors.keys.elementAt(0)][0];
        break;
      case 401:
        apiResponse.error = unauthorized;
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

Future<ApiResponse> editMenu(int id, String namaMenu, String deskripsi, int harga, int stok, int idKantin, String? image) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.put(Uri.parse('$kantinURL/$idKantin/menu/$id'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: image != null
            ? {
                'nama_menu': namaMenu,
                'deskripsi': deskripsi,
                'harga': harga,
                'stok': stok,
                'image': image
              }
            : {
                //klo image gada,
                'nama_menu': namaMenu,
                'deskripsi': deskripsi,
                'harga': harga,
                'stok': stok
              });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
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

Future<ApiResponse> deleteMenu(int id) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.delete(Uri.parse('$menuURL/$id'), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    switch (response.statusCode) {
      case 200:
        apiResponse.data = jsonDecode(response.body)['message'];
        break;
      case 403:
        apiResponse.error = jsonDecode(response.body)['message'];
        break;
      case 401:
        apiResponse.error = unauthorized;
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
