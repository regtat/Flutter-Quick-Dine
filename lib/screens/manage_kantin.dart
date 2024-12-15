// import 'package:flutter/material.dart';
// import 'package:quick_dine/constant.dart';
// import 'package:quick_dine/models/api_response.dart';
// import 'package:quick_dine/models/kantin.dart';
// import 'package:quick_dine/screens/kantin_form.dart';
// import 'package:quick_dine/screens/login.dart';
// import 'package:quick_dine/services/kantin_service.dart';
// import 'package:quick_dine/services/user_service.dart';

// class ManageKantin extends StatefulWidget {
//   @override
//   _ManageKantinState createState() => _ManageKantinState();
// }

// class _ManageKantinState extends State<ManageKantin> {
//   List<dynamic> _kantinList = [];
//   bool _loading = true;

//   // get all kantins
//   Future<void> retrieveKantin() async {
//     setState(() {
//       _loading = true;
//     });

//     ApiResponse response = await getKantin();

//     if (response.error == null) {
//       setState(() {
//         _kantinList = response.data as List<dynamic>;
//         _loading = _loading ? !_loading : _loading;
//       });
//     } else if (response.error == unauthorized) {
//       await logout().then((value) => {
//             Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(builder: (context) => Login()),
//                 (route) => false)
//           });
//     } else {
//       setState(() {
//       _loading = false;
//     });
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('${response.error}'),
//       ));
//     }
//   }

//   void _handleDeleteKantin(int id) async {
//     ApiResponse response = await deleteKantin(id);
//     if (response.error == null) {
//       retrieveKantin();
//     } else if (response.error == unauthorized) {
//       await logout().then((value) => {
//             Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(builder: (context) => Login()),
//                 (route) => false)
//           });
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('${response.error}')));
//     }
//   }

//   @override
//   void initState() {
//     retrieveKantin();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//     Scaffold(
//       appBar: AppBar(
//         title: Text('Kelola Kantin'),
//       ),body: _loading
//         ? Center(child: CircularProgressIndicator())
//         : RefreshIndicator(
//             onRefresh: () {
//               return retrieveKantin();
//             },
//             child: ListView.builder(
//                 itemCount: _kantinList.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   Kantin kantin = _kantinList[index];
//                   return Container(
//                     padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 6),
//                               child: Row(
//                                 children: [
                                  
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(
//                                     '${kantin.nama_kantin}',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w600,
//                                         fontSize: 17),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             kantin.id == idKantin
//                                 ? PopupMenuButton(
//                                     child: Padding(
//                                         padding: EdgeInsets.only(right: 10),
//                                         child: Icon(
//                                           Icons.more_vert,
//                                           color: Colors.black,
//                                         )),
//                                     itemBuilder: (context) => [
//                                       PopupMenuItem(
//                                           child: Text('Edit'), value: 'edit'),
//                                       PopupMenuItem(
//                                           child: Text('Delete'),
//                                           value: 'delete')
//                                     ],
//                                     onSelected: (val) {
//                                       if (val == 'edit') {
//                                         Navigator.of(context).push(
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     KantinForm(
//                                                       title: 'Edit Kantin',
//                                                       kantin: kantin,
//                                                     )));
//                                       } else {
//                                         _handleDeleteKantin(kantin.id ?? 0);
//                                       }
//                                     },
//                                   )
//                                 : SizedBox()
//                           ],
//                         ),
                        
                       
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 0.5,
//                           color: Colors.black26,
//                         ),
//                       ],
//                     ),
//                   );
//                 }),
//           );
//   }
// }
