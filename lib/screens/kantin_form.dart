import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quick_dine/constant.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class KantinForm extends StatefulWidget {
  @override
  _KantinFormState createState() => _KantinFormState();
}

class _KantinFormState extends State<KantinForm> {
  List<dynamic> _karyawanList = [];
  int? _selectedKaryawanId;
  String _namaKantin = '';

  @override
  void initState() {
    super.initState();
    fetchKaryawan();
  }

  Future<void> fetchKaryawan() async {
    try {
      String token = await getToken();

      final response = await http.get(
        Uri.parse(userURL),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        List<dynamic> dataKaryawan = jsonDecode(response.body)['users'];
        setState(() {
          _karyawanList = dataKaryawan;
        });
      } else {
        throw Exception('Failed to load karyawan');
      }
    } catch (e) {
      print('Error fetching karyawan: $e');
    }
  }

  Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('token') ?? '';
  }

  void submitKantin() async {
    if (_namaKantin.isNotEmpty && _selectedKaryawanId != null) {
      try {
        String token = await getToken();

        final response = await http.post(
          Uri.parse(kantinURL),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            'nama_kantin': _namaKantin,
            'id_karyawan': _selectedKaryawanId,
          }),
        );

        if (response.statusCode == 200) {
          print('Kantin berhasil ditambahkan');
        } else {
          throw Exception('Failed to add Kantin');
        }
      } catch (e) {
        print('Error adding kantin: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form Kantin')),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => setState(() => _namaKantin = value),
            decoration: InputDecoration(labelText: 'Nama Kantin'),
          ),
          DropdownButton<int>(
            hint: Text('Pilih Karyawan'),
            value: _selectedKaryawanId,
            items: _karyawanList.map((karyawan) {
              return DropdownMenuItem<int>(
                value: karyawan['id'],
                child: Text(karyawan['name']),
              );
            }).toList(),
            onChanged: (int? value) {
              setState(() {
                _selectedKaryawanId = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: submitKantin,
            child: Text('Tambah Kantin'),
          ),
        ],
      ),
    );
  }
}
