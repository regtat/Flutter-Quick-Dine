
// import 'package:flutter/material.dart';
// import 'package:quick_dine/models/api_response.dart';

// import 'login.dart';

// class MenuScreen extends StatefulWidget {
//   @override
//   _MenuScreenState createState() => _MenuScreenState();
// }

// class _MenuScreenState extends State<MenuScreen> {
//   List<dynamic> _menuList = [];
//   int userId = 0;
//   bool _loading = true;

//   // get all menu
//   Future<void> retrieveMenu() async {
//     userId = await getKantinId();
//     ApiResponse response = await getMenu();

//     if(response.error == null){
//       setState(() {
//         _menuList = response.data as List<dynamic>;
//         _loading = _loading ? !_loading : _loading;
//       });
//     }
//     else if (response.error == unauthorized){
//       logout().then((value) => {
//         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login()), (route) => false)
//       });
//     }
//     else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('${response.error}'),
//       ));
//     }
//   }


//   void _handleDeleteMenu(int menuId) async {
//     ApiResponse response = await deleteMenu(menuId);
//     if (response.error == null){
//       retrieveMenu();
//     }
//     else if(response.error == unauthorized){
//       logout().then((value) => {
//         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login()), (route) => false)
//       });
//     } 
//     else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('${response.error}')
//       ));
//     }
//   }



//   // Menu like dislik
//   void _handlemenuLikeDislike(int menuId) async {
//     ApiResponse response = await likeUnlikeMenu(menuId);

//     if(response.error == null){
//       retrieveMenu();
//     }
//     else if(response.error == unauthorized){
//       logout().then((value) => {
//         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login()), (route) => false)
//       });
//     } 
//     else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text('${response.error}')
//       ));
//     }
//   }

//   @override
//   void initState() {
//     retrieveMenu();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _loading ? Center(child:CircularProgressIndicator()) :
//     RefreshIndicator(
//       onRefresh: () {
//         return retrieveMenu();
//       },
//       child: ListView.builder(
//         itemCount: _menuList.length,
//         itemBuilder: (BuildContext context, int index){
//           Menu menu = _menuList[index];
//           return Container(
//             padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 6),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 38,
//                             height: 38,
//                             decoration: BoxDecoration(
//                               image: menu.user!.image != null ?
//                                 DecorationImage(image: NetworkImage('${menu.user!.image}')) : null,
//                               borderRadius: BorderRadius.circular(25),
//                               color: Colors.amber
//                             ),
//                           ),
//                           SizedBox(width: 10,),
//                           Text(
//                             '${menu.user!.name}',
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 17
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     menu.user!.id == userId ?
//                     PopupMenuButton(
//                       child: Padding(
//                         padding: EdgeInsets.only(right:10),
//                         child: Icon(Icons.more_vert, color: Colors.black,)
//                       ),
//                       itemBuilder: (context) => [
//                         PopupMenuItem(
//                           child: Text('Edit'),
//                           value: 'edit'
//                         ),
//                         PopupMenuItem(
//                           child: Text('Delete'),
//                           value: 'delete'
//                         )
//                       ],
//                       onSelected: (val){
//                         if(val == 'edit'){
//                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MenuForm(
//                              title: 'Edit Menu',
//                              menu: menu,
//                            )));
//                         } else {
//                           _handleDeleteMenu(menu.id ?? 0);
//                         }
//                       },
//                     ) : SizedBox()
//                   ],
//                 ),
//                 SizedBox(height: 12,),
//                 Text('${menu.body}'),
//                 menu.image != null ?
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 180,
//                   margin: EdgeInsets.only(top: 5),
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: NetworkImage('${menu.image}'),
//                       fit: BoxFit.cover
//                     )
//                   ),
//                 ) : SizedBox(height: menu.image != null ? 0 : 10,),
//                 Row(
//                   children: [
//                     kLikeAndComment(
//                       menu.likesCount ?? 0,
//                       menu.selfLiked == true ? Icons.favorite : Icons.favorite_outline,
//                       menu.selfLiked == true ? Colors.red : Colors.black54,
//                       (){
//                         _handleMenuLikeDislike(menu.id ?? 0);
//                       }
//                     ),
//                     Container(
//                       height: 25,
//                       width: 0.5,
//                       color: Colors.black38,
//                     ),
//                     kLikeAndComment(
//                       menu.commentsCount ?? 0,
//                       Icons.sms_outlined,
//                       Colors.black54,
//                       (){
//                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CommentScreen(
//                           menuId: menu.id,
//                         )));
//                       }
//                     ),
//                   ],
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 0.5,
//                   color: Colors.black26,
//                 ),
//               ],
//             ),
//           );
//         }
//       ),
//     );
//   }
// }