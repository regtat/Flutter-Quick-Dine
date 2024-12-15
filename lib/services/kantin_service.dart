// import 'dart:convert';

// import 'package:quick_dine/constant.dart';
// import 'package:quick_dine/models/api_response.dart';
// import 'package:http/http.dart' as http;
// import 'package:quick_dine/models/kantin.dart';
// import 'package:quick_dine/services/user_service.dart';

// Future<ApiResponse> getKantin() async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     String token = await getToken();
//     final response = await http.get(Uri.parse(kantinURL), headers: {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//     });
//     switch (response.statusCode) {
//       case 200:
//         apiResponse.data = jsonDecode(response.body)['kantin']
//             .map((k) => Kantin.fromJson(k))
//             .toList();
//         //(list kantin) item ke model. map each item to kantin model
//         apiResponse.data as List<dynamic>;
//         break;
//       case 401:
//         apiResponse.error = unauthorized;
//         break;
//       default:
//         apiResponse.error = somethingWentWrong;
//         break;
//     }
//   } catch (e) {
//     apiResponse.error = serverError;
//   }
//   return apiResponse;
// }

// class ApiService {
//   Future<List<Kantin>> fetchKantin() async {
//     final response = await http.get(Uri.parse(kantinURL));
//     if (response.statusCode == 200) {
//       final List data = jsonDecode(response.body)['kantin'];
//       return data.map((e) => Kantin.fromJson(e)).toList();
//     } else {
//       throw Exception('Failed to load Kantin');
//     }
//   }

//   Future<String> addKantin(String namaKantin, int idKaryawan) async {
//     ApiResponse apiResponse = ApiResponse();
//   try {
//     String token = await getToken();
//     final response = await http.kantin(
//       Uri.parse(kantinURL),
//       headers: {
//           'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//       },
//       body: jsonEncode({
//         'nama_kantin': namaKantin,
//         'id_karyawan': idKaryawan,
//       }),
//     );

//     if (response.statusCode == 200) {
//       return jsonDecode(response.body)['message'];
//     } else {
//       throw Exception('Failed to add Kantin');
//     }
//   }
//   }
// }

// // Future<ApiResponse> addKantin(String namaKantin, int idKaryawan) async {
// //   ApiResponse apiResponse = ApiResponse();
// //   try {
// //     String token = await getToken();
// //     final response = await http.kantin(Uri.parse(kantinURL), headers: {
// //       'Accept': 'application/json',
// //       'Authorization': 'Bearer $token'
// //     }, body: {
// //       'nama_kantin': namaKantin,
// //       'id_karyawan': idKaryawan.toString()
// //     },
// //     );
// //     switch (response.statusCode) {
// //       case 200:
// //         apiResponse.data = jsonDecode(response.body);
// //         break;
// //       case 422:
// //         final errors = jsonDecode(response.body)['errors'];
// //         apiResponse.error = errors[errors.keys.elementAt(0)][0];
// //         break;
// //       case 401:
// //         apiResponse.error = unauthorized;
// //         break;
// //       default:
// //         apiResponse.error = somethingWentWrong;
// //         break;
// //     }
// //   } catch (e) {
// //     apiResponse.error = serverError;
// //   }
// //   return apiResponse;
// // }

// Future<ApiResponse> editKantin(
//     int id, String namaKantin, int idKaryawan) async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     String token = await getToken();
//     final response = await http.put(Uri.parse('$kantinURL/$id'), headers: {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//     }, body: {
//       'nama_kantin': namaKantin,
//       'id_karyawan': idKaryawan
//     });
//     switch (response.statusCode) {
//       case 200:
//         apiResponse.data = jsonDecode(response.body)['message'];
//         break;
//       case 403:
//         apiResponse.error = jsonDecode(response.body)['message'];
//         break;
//       case 401:
//         apiResponse.error = unauthorized;
//         break;
//       default:
//         apiResponse.error = somethingWentWrong;
//         break;
//     }
//   } catch (e) {
//     apiResponse.error = serverError;
//   }
//   return apiResponse;
// }

// Future<ApiResponse> deleteKantin(int id) async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     String token = await getToken();
//     final response = await http.delete(Uri.parse('$kantinURL/$id'), headers: {
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token'
//     });
//     switch (response.statusCode) {
//       case 200:
//         apiResponse.data = jsonDecode(response.body)['message'];
//         break;
//       case 403:
//         apiResponse.error = jsonDecode(response.body)['message'];
//         break;
//       case 401:
//         apiResponse.error = unauthorized;
//         break;
//       default:
//         apiResponse.error = somethingWentWrong;
//         break;
//     }
//   } catch (e) {
//     apiResponse.error = serverError;
//   }
//   return apiResponse;
// }

// // Future<List<Map<String, dynamic>>> fetchUsers() async {
// //   List<Map<String, dynamic>> users = [];
// //   try {
// //     String token = await getToken();
// //     final response = await http.get(
// //       Uri.parse(userURL), // URL endpoint yang berisi daftar user
// //       headers: {
// //         'Accept': 'application/json',
// //         'Authorization': 'Bearer $token',
// //       },
// //     );

// //     if (response.statusCode == 200) {
// //       users = List<Map<String, dynamic>>.from(jsonDecode(response.body));
// //     } else {
// //       throw Exception("Failed to fetch users");
// //     }
// //   } catch (e) {
// //     print(e);
// //   }
// //   return users;
// // }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quick_dine/constant.dart';
import 'package:quick_dine/models/api_response.dart';
import 'package:quick_dine/models/kantin.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ApiResponse> getKantin() async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.get(Uri.parse(kantinURL),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
        if (response.statusCode == 200) {
      List<dynamic> dataKantin = jsonDecode(response.body)['kantin'];
      apiResponse.data = dataKantin.map((k) => Kantin.fromJson(k)).toList();
    } else if (response.statusCode == 401) {
      apiResponse.error = unauthorized;
    } else {
      apiResponse.error = somethingWentWrong;
    }
  } catch (e) {
    apiResponse.error = serverError;
  }

  return apiResponse;
}

Future<ApiResponse> editKantin(int id, String namaKantin) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.put(Uri.parse('$kantinURL/$id'),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      'nama_kantin': namaKantin
    });

    switch(response.statusCode){
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
  }
  catch (e){
    apiResponse.error = serverError;
  }
  return apiResponse;
}


// Delete kantin
Future<ApiResponse> deleteKantin(int id) async {
  ApiResponse apiResponse = ApiResponse();
  try {
    String token = await getToken();
    final response = await http.delete(Uri.parse('$kantinURL/$id'),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    switch(response.statusCode){
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
  }
  catch (e){
    apiResponse.error = serverError;
  }
  return apiResponse;
}


// Mengambil token dari SharedPreferences
Future<String> getToken() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString('token') ?? '';
}

Future<String> addKantin(String namaKantin, int idKaryawan) async {
  String token = await getToken();
  final response = await http.post(
    Uri.parse(kantinURL),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },
    body: jsonEncode({
      'nama_kantin': namaKantin,
      'id_karyawan': idKaryawan,
    }),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['message'];
  } else {
    throw Exception('Failed to add Kantin');
  }
}


Future<List<dynamic>> fetchUsers() async {
  final response = await http.get(Uri.parse(userURL));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['users'];
  } else {
    throw Exception('Failed to load users');
  }
}