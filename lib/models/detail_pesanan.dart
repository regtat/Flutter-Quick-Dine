class DetailPesanan {
  int id;
  int idPesanan;
  int idKantin;
  int idMenu;
  int? jumlah;
  int? subtotal;
  DateTime createdAt;
  DateTime updateAt;

  DetailPesanan({
    required this.id,
    required this.idPesanan,
    required this.idKantin,
    required this.idMenu,
    this.jumlah,
    this.subtotal,
    required this.createdAt,
    required this.updateAt,
  });

  // Factory untuk membuat objek Order dari JSON
  factory DetailPesanan.fromJson(Map<String, dynamic> json) {
    return DetailPesanan(
      id: json['id'] ?? '',
      idKantin: json['id_kantin'] ?? '',
      idMenu: json['id_menu'] ?? '',
      idPesanan: json['id_pesanan'] ?? '',
      jumlah: json['jumlah'] ?? 0,
      subtotal: json['subtotal'] ?? 0,
      createdAt: DateTime.parse(json['user']['created_at']),
      updateAt: DateTime.parse(json['user']['update_at']),
    );
  }

  // Mengonversi objek Order menjadi Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_kantin': idKantin,
      'id_menu': idMenu,
      'id_pesanan': idPesanan,
      'jumlah': jumlah,
      'subtotal': subtotal,
      'created_at': createdAt.toIso8601String(),
      'update_at': updateAt.toIso8601String(),
    };
  }

  // Mengonversi objek Order menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_kantin': idKantin,
      'id_menu': idMenu,
      'id_pesanan': idPesanan,
      'jumlah': jumlah,
      'subtotal': subtotal,
      'created_at': createdAt.toIso8601String(),
      'update_at': updateAt.toIso8601String(),
    };
  }
}
