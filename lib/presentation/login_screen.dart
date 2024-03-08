import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/controllers/auth_controller.dart';
import 'package:statemanagement/presentation/signup_screen.dart';

import '../utilities/validation.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

// Validation function for email field
//   String? _validateEmail(value) {
//     if (value.isEmpty) {
//       return 'Please enter your email';
//     } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//       return 'Please enter a valid email';
//     }
//     return null;
//   }

  // Validation function for password field
  // String? _validatePassword( value) {
  //   if (value.isEmpty) {
  //     return 'Please enter your password';
  //   } else if (value.length < 6) {
  //     return 'Password must be at least 6 characters long';
  //   }
  //   return null;
  // }
  //LoginModel loginModel = LoginModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        child: Text('Sign Up '),
        onTap: () {
          Get.to(() => const SignupScreen());
        },
      ),
      appBar: AppBar(
        title: Center(child: const Text('Login Screen')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<AuthController>(builder: (authController) {
          return Form(
            key: _formKey,
            child: Column(
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
                    validator: (value) => Validation().validationEmail(value!)

                    //         validator: _validateEmail
                    ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                  validator:(value)=> Validation()
                      .validationPassword(value
                          //          validator: _validatePassword,
                          ),
                ),
                SizedBox(height: 20.0),
                authController.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // If all validators pass, submit the form
                              setState(() {});
                              await authController.loginFirebaseWith(
                                _emailController.text.toString(),
                                _passwordController.text.toString(),
                              );
                            }
                          },
                          // onPressed: () async {
                          //   setState(() {});
                          //   // loginModel = await AuthApi().postData(_emailController.text.toString(),
                          //   //     _passwordController.text.toString());
                          //   // setState(() {});
                          //
                          // await  authController.loginFirebaseWith(_emailController.text.toString(),
                          //       _passwordController.text.toString());
                          //
                          // },
                          child: const Text('Submit'),
                        ),
                      ),

                // Column(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       'id:${authController.loginModel.user?.id.toString() ?? ''}',
                //       style: TextStyle(
                //         fontSize: 20,
                //         fontStyle: FontStyle.italic,
                //       ),
                //     ),
                //     SizedBox(
                //       height: 5,
                //     ),
                //     Text(
                //         'FirstName:${authController.loginModel.user?.firstName.toString() ?? ''}',
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontStyle: FontStyle.italic,
                //         )),
                //     SizedBox(
                //       height: 5,
                //     ),
                //     Text(
                //         'LastName:${authController.loginModel.user?.lastName.toString() ?? ''}',
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontStyle: FontStyle.italic,
                //         )),
                //     SizedBox(
                //       height: 5,
                //     ),
                //     Text(
                //         'Email:${authController.loginModel.user?.email.toString() ?? ''}',
                //         style: TextStyle(
                //           fontSize: 20,
                //           fontStyle: FontStyle.italic,
                //         )),
                //   ],
                // )
              ],
            ),
          );
        }),
      ),
    );
  }
}
