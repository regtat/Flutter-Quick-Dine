class Menu {
  final int id;
  final String namaMenu;
  final String deskripsi;
  final int harga;
  final int stok;
  final String? image;
  final int idKantin;
  final String namaKantin;

  Menu({
    required this.id,
    required this.namaMenu,
    required this.deskripsi,
    required this.harga,
    required this.stok,
    this.image,
    required this.idKantin,
    required this.namaKantin
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['id'],
      namaMenu: json['nama_menu'],
      deskripsi: json['deskripsi'],
      harga: json['harga'],
      stok: json['stok'],
      image: json['image'],
      idKantin: json['id_kantin'],
      namaKantin: json['kantin']['nama_kantin'],
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_menu': namaMenu,
      'deskripsi': deskripsi,
      'harga': harga,
      'stok': stok,
      'image': image,
      'id_kantin': idKantin,
      'nama_kantin': namaKantin,
    };
  }
}