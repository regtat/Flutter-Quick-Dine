// import 'package:quick_dine/models/kantin.dart';
// import 'package:quick_dine/models/user.dart';

// class Pesanan {
//   int? id;
//   Kantin? kantin;
//   User? user;
//   int? total;
//   String? metodePembayaran;
//   String? buktiPembyaran;
//   String? diantarDiambil;
//   String? lokPengantaran;
//   String? status;
//   // DateTime createdAt;
//   // DateTime updateAt;

//   Pesanan({
//      this.id,
//      this.kantin,
//      this.user,
//     this.total,
//      this.metodePembayaran,
//     this.buktiPembyaran,
//      this.diantarDiambil,
//     this.lokPengantaran,
//     this.status,
//     // required this.createdAt,
//     // required this.updateAt,
//   });

//   // Factory untuk membuat objek Order dari JSON
//   factory Pesanan.fromJson(Map<String, dynamic> json) {
//     return Pesanan(
//       id: json['id'],
//       kantin: Kantin(
//         id: json['kantin']['id'],
//         namaKantin: json['kantin']['nama_kantin']
//       ),
//       user: User(
//         id: json['user']['id'],
//         name: json['user']['name']
//       ),
//       total: json['total'] ?? 0,
//       metodePembayaran: json['metode_pembayaran'] ?? '',
//       buktiPembyaran: json['bukti_pembayaran'] ?? '',
//       diantarDiambil: json['diantar_diambil'] ?? '',
//       lokPengantaran: json['lok_pengantaran'] ?? '',
//       status: json['status'] ?? '',
//       // createdAt: DateTime.parse(json['user']['created_at']),
//       // updateAt: DateTime.parse(json['user']['update_at']),
//     );
//   }

//   // Mengonversi objek Order menjadi Map
//   // Map<String, dynamic> toMap() {
//   //   return {
//   //     'id': id,
//   //     'id_kantin': idKantin,
//   //     'id_user': idUser,
//   //     'total': total,
//   //     'metode_pembayaran': metodePembayaran,
//   //     'bukti_pembayaran': buktiPembyaran,
//   //     'diantar_diambil': diantarDiambil,
//   //     'lok_pengantaran': lokPengantaran,
//   //     'status': status,
//   //     'created_at': createdAt.toIso8601String(),
//   //     'update_at': updateAt.toIso8601String(),
//   //   };
//   // }

//   // // Mengonversi objek Order menjadi JSON
//   // Map<String, dynamic> toJson() {
//   //   return {
//   //     'id': id,
//   //     'id_kantin': idKantin,
//   //     'id_user': idUser,
//   //     'total': total,
//   //     'metode_pembayaran': metodePembayaran,
//   //     'bukti_pembayaran': buktiPembyaran,
//   //     'diantar_diambil': diantarDiambil,
//   //     'lok_pengantaran': lokPengantaran,
//   //     'status': status,
//   //     'created_at': createdAt.toIso8601String(),
//   //     'update_at': updateAt.toIso8601String(),
//   //   };
//   // }
// }
