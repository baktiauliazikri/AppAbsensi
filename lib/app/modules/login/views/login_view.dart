import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
autocorrect: false,
            controller: controller.emailC,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
              ),
          ),
          SizedBox(height: 20),
          TextField(
autocorrect: false,
            obscureText: true,
            controller: controller.passC,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
              ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: (){
              controller.login();
            }, 
            child: Text("Login")
            ),
          TextButton(onPressed: (){}, child: Text("Lupa Password?")),
        ], 
      ),
    );
  }
}
