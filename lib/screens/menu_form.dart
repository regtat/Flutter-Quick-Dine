// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:quick_dine/constant.dart';
// import 'package:quick_dine/models/api_response.dart';
// import 'package:quick_dine/services/menu_service.dart';
// import 'package:quick_dine/services/user_service.dart';
// import 'package:quick_dine/views/login.dart';

// class MenuForm extends StatefulWidget {
//   @override
//   _MenuFormState createState() => _MenuFormState();
// }

// class _MenuFormState extends State<MenuForm> {
//   final TextEditingController 
//       namaController = TextEditingController(),
//       deskripsiController = TextEditingController(),
//       hargaController = TextEditingController(),
//       stokController = TextEditingController(),
//       kantinController = TextEditingController();

//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   bool loading = false;
//   File? _imageFile;
//   final _picker = ImagePicker(); //_ = private

//   Future getImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   void _addMenu() async {
//     String? image = _imageFile == null ? null : getStringImage(_imageFile);
//     ApiResponse response = await addMenu(
//       namaController.text,
//       deskripsiController.text,
//       int.parse(hargaController.text),
//       int.parse(stokController.text),
//       int.parse(kantinController.text),
//       image,
//     );

//     if (response.error == null) {
//       Navigator.of(context).pop();

//       ///kembali ke halaman sblmnya
//     } else if (response.error == unauthorized) {
//       logout().then((value) => {
//             Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(builder: (context) => Login()),
//                 (route) => false)
//           });
//     }
//   }

//   int currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tambah Menu'),
//       ),
//       body: loading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView(
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 200,
//                   decoration: BoxDecoration(
//                       image: _imageFile == null
//                           ? null
//                           : DecorationImage(
//                               image: FileImage(
//                                   _imageFile ?? File('')), //tampilin image
//                               fit: BoxFit.cover)),
//                   child: Center(
//                     child: IconButton(
//                         icon: Icon(Icons.image, size: 50, color: Colors.black),
//                         onPressed: () {
//                           getImage();
//                         }),
//                   ),
//                 ),
//                 Form(
//                     key: formKey,
//                     child: ListView(padding: EdgeInsets.all(30), children: [
//                       TextFormField(
//                         controller: kantinController,
//                         validator: (val) =>
//                             val!.isEmpty ? 'Kantin harus diisi' : null,
//                         decoration: loginInputDecoration('Kantin'),
//                       ),
//                       const SizedBox(height: 20),
//                       TextFormField(
//                         controller: namaController,
//                         validator: (val) =>
//                             val!.isEmpty ? 'nama harus diisi' : null,
//                         decoration: loginInputDecoration('Nama Menu'),
//                       ),
//                       const SizedBox(height: 20),
//                       TextFormField(
//                         controller: deskripsiController,
//                         keyboardType: TextInputType.multiline,
//                         maxLines: 9,
//                         validator: (val) => val!.isEmpty ? 'Harus diisi' : null,
//                         decoration: InputDecoration(
//                             hintText: 'Deskripsi menu',
//                             border: OutlineInputBorder(
//                                 borderSide:
//                                     BorderSide(width: 1, color: Colors.black))),
//                       ),
//                       const SizedBox(height: 20),
//                       TextFormField(
//                         controller: hargaController,
//                         keyboardType: TextInputType.number,
//                         // validator: (val)=>val!.isEmpty?'Harga harus diisi':null,
//                         validator: (val) {
//                           if (val == null || val.isEmpty) {
//                             return 'Harga harus diisi';
//                           }
//                           if (int.tryParse(val) == null) {
//                             return 'Masukkan angka yang valid';
//                           }
//                           return null;
//                         },
//                         decoration: loginInputDecoration('Harga'),
//                       ),
//                       const SizedBox(height: 20),
//                       TextFormField(
//                         controller: stokController,
//                         // validator: (val) =>
//                         //     val!.isEmpty ? 'Stok harus diisi' : null,
//                         validator: (val) {
//                           if (val == null || val.isEmpty) {
//                             return 'Stok harus diisi';
//                           }
//                           if (int.tryParse(val) == null) {
//                             return 'Masukkan angka yang valid';
//                           }
//                           return null;
//                         },
//                         decoration: loginInputDecoration('Stok'),
//                       ),
//                       const SizedBox(height: 20),
//                     ])),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   child: kTextButton('Tambah Mnenu', () {
//                     if (formKey.currentState!.validate()) {
//                       setState(() {
//                         loading = true;
//                       });
//                       _addMenu();
//                     }
//                   }),
//                 )
//               ],
//             ),
//     );
//   }
// }
