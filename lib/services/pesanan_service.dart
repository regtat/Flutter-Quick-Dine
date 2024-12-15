// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:quick_dine/models/api_response.dart';
// import 'package:quick_dine/models/pesanan.dart';
// import 'package:quick_dine/services/user_service.dart';
// import 'package:quick_dine/constant.dart';

// Future<ApiResponse> getPesanan(int idUser) async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     String token = await getToken();
//     final response = await http.get(
//       Uri.parse('$pesananURL?id_user=$idUser'),
//       headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
//     );
//     switch (response.statusCode) {
//       case 200:
//         apiResponse.data = jsonDecode(response.body)['pesanan']
//             .map((p) => Pesanan.fromJson(p))
//             .toList();
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

// Future<ApiResponse> createPesanan(Pesanan pesanan) async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     String token = await getToken();
//     final response = await http.post(
//       Uri.parse(pesananURL),
//       headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
//       body: pesanan.toJson(),
//     );
//     switch (response.statusCode) {
//       case 200:
//         apiResponse.data = jsonDecode(response.body);
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
