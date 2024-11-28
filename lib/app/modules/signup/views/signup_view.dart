import 'package:dermascan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final SignupController signupController = Get.put(SignupController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Obx(
        () => signupController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: "Email"),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Password"),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        signupController.signup(
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      child: Text("Sign Up"),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAll(Routes.LOGIN);
                      },
                      child: Text("Already have an account? Login"),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
