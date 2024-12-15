//endpoint

import 'package:flutter/material.dart';

const baseURL='http://127.0.0.1:8000/api';
const loginURL=baseURL+'/login';
const registerURL=baseURL+'/register';
const logoutURL=baseURL+'/logout';
const userURL=baseURL+'/users';
const kantinURL=baseURL+'/kantin';
const menuURL=baseURL+'/menu';
const pesananURL=baseURL+'/pesanan';

const serverError='Server error';
const unauthorized='Unauthorized';
const somethingWentWrong='Something went wrong, try again!';

InputDecoration loginInputDecoration(String label){
  return InputDecoration(
    labelText: label,
    contentPadding: EdgeInsets.all(10),
    border: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.black), borderRadius: BorderRadius.circular(10))
  );
}

TextButton kTextButton(String label, Function onPressed){
  return TextButton(
    onPressed: () => onPressed(),
    child: Text(
      label,
      style: TextStyle(color: Colors.white),
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.blue),
padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(vertical: 10),
      ),
    ),
  );
}

Row kLoginRegisterHint(String text, String label, Function onTap){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
    Text(text),
    GestureDetector(
      child: Text(label, style: TextStyle(color: Colors.green)),
      onTap: ()=> onTap()
    )
  ],);
}


