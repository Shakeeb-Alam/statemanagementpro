import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:getapi/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:statemanagement/api/authapi.dart';
import 'package:statemanagement/controllers/auth_controller.dart';

// import '../Api/loginapi.dart';
import '../Domain/login_model.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //LoginModel loginModel = LoginModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextFormField Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<AuthController>(builder: (authController) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
              ),
              const SizedBox(height: 20.0),
              authController.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {});
                          // loginModel = await AuthApi().postData(_emailController.text.toString(),
                          //     _passwordController.text.toString());
                          // setState(() {});

                          authController.login(_emailController.text.toString(),
                              _passwordController.text.toString());
                        },
                        child: const Text('Submit'),
                      ),
                    ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'id:${authController.loginModel.user?.id.toString() ?? ''}',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      'FirstName:${authController.loginModel.user?.firstName.toString() ?? ''}',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      'LastName:${authController.loginModel.user?.lastName.toString() ?? ''}',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      'Email:${authController.loginModel.user?.email.toString() ?? ''}',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                      )),
                ],
              )
            ],
          );
        }),
      ),
    );
  }
}
