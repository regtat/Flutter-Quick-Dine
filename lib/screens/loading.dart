import 'package:flutter/material.dart';
import 'package:quick_dine/constant.dart';
import 'package:quick_dine/models/api_response.dart';
import 'package:quick_dine/services/user_service.dart';
import 'package:quick_dine/screens/home.dart';
import 'package:quick_dine/screens/login.dart';

class Loading extends StatefulWidget{
  @override
  _LoadingState createState()=>_LoadingState();
}

class _LoadingState extends State<Loading> {
  void _loadUserInfo() async{ //call getUser with that token, if success then navigate to home, else navigate to login
    String token = await getToken();
    if(token==''){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login()), (route)=>false); //pushAndRemoveUntil=removes the existing screens while the condition returs false(route)=>false
    }
    //remove the existing screen here because we dont want the user can go back from login screen
    else{
      ApiResponse response=await getUser();
      if(response.error==null){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Home()), (route)=>false);
      }else if(response.error==unauthorized){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login()), (route)=>false);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error}')));
      }
    }
  }

//call funct userInfo on initstate
  @override
  void initState() {
    _loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
      );
  }
}
