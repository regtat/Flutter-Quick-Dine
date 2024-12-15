import 'package:flutter/material.dart';
import 'package:quick_dine/constant.dart';
import 'package:quick_dine/models/api_response.dart';
import 'package:quick_dine/models/user.dart';
import 'package:quick_dine/services/user_service.dart';
import 'package:quick_dine/screens/home.dart';
import 'package:quick_dine/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState()=>_RegisterState();
}

class _RegisterState extends State<Register>{
  final TextEditingController
  emailController = TextEditingController(),passwordController = TextEditingController(),
  passwordConfirmController = TextEditingController(),
  notelpController = TextEditingController(),
  namaController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool loading=false;

  void _registerUser() async{
    ApiResponse response=await register(
      namaController.text,
    emailController.text,
    passwordController.text,
    notelpController.text, 'mahasiswa');
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
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder:(context)=>Home()), (route)=>false);
      }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daftar',
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
              'Halaman Registrasi',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: namaController,
              validator: (val)=>val!.isEmpty?'invalid name':null,
              decoration: loginInputDecoration('Nama'
              ),
            ),
            const SizedBox(height: 20),

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
              decoration: loginInputDecoration('Password'
              ),
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: passwordConfirmController,
              validator: (val)=>val != passwordController.text ?'Password tidak sama':null,
              obscureText: true,
              decoration: loginInputDecoration('Konfirmasi Password'
              ),
            ),
            const SizedBox(height: 20),

            TextFormField(
              controller: notelpController,
              keyboardType: TextInputType.phone,
              validator: (val){
                if (val == null || val.isEmpty) {
                  return 'Nomor telepon tidak valid';
                }
                if (val.length != 12) {
                  return 'Nomor telepon harus terdiri dari 12 digit';
                }
                // Cek apakah val hanya berisi angka
                if (!RegExp(r'^[0-9]+$').hasMatch(val)) {
                  return 'Nomor telepon hanya boleh berisi angka';
                }
                return null;
              },
              decoration: loginInputDecoration('Nomor Telepon'
              ).copyWith(hintText: '081234567891')
            ),
            const SizedBox(height: 20),
            loading? Center(child: CircularProgressIndicator(),):
            kTextButton('Daftar', (){
              if(formKey.currentState!.validate()){
                setState((){
                loading=true;
                _registerUser();
              });}
            }),
            
          

              SizedBox(height: 10,),
              kLoginRegisterHint('Sudah memiliki akun?', 'Login', (){
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Login()), (route)=>false);
              })
            
          ],
        ),
      ),
      );
  }
}