import 'package:flutter/material.dart';
import 'package:quick_dine/constant.dart';
import 'package:quick_dine/models/api_response.dart';
import 'package:quick_dine/models/user.dart';
import 'package:quick_dine/services/user_service.dart';
import 'package:quick_dine/screens/home.dart';
import 'package:quick_dine/screens/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState()=>_LoginState();
}

class _LoginState extends State<Login>{

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool loading=false;

  void _loginUser() async{
    ApiResponse response=await login(emailController.text, passwordController.text);
    if(response.error==null){
      _saveAndRedirectToHome(response.data as User);
    }else{
      setState(() {
        loading=false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error}'),));
    }
  }

  void _saveAndRedirectToHome(User user) async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    await pref.setString('token', user.token??'');
    await pref.setInt('idUser', user.id??0);
    await pref.setString('role', user.role ?? '');

    if(user.role=='admin'){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context)=>Home()), (route)=>false);
    }
      }
 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 68, 68, 68),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(30),
          children: [
            Text(
              'Halaman Login',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            

            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
              validator: (val)=>val!.isEmpty?'invalid email address':null,
              
              decoration: loginInputDecoration('Email')
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: passwordController,
              validator: (val)=>val!.length<6?'required at least 6 chars':null,
              obscureText: true,
              decoration: loginInputDecoration('password'
              ),
            ),
            const SizedBox(height: 30),
            loading? Center(child: CircularProgressIndicator(),):
            kTextButton('Login', (){
              if(formKey.currentState!.validate()){
                setState((){
                loading=true;
                _loginUser();
              });
              }
            }),
            
          
              kLoginRegisterHint('Belum memiliki akun?', 'Registrasi', (){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context)=>Register()), (route)=>false);
              })
            
          ],
        ),
      ),
      );
  }
}