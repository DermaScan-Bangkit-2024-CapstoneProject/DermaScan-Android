import 'package:dermascan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final LoginController loginController = Get.put(LoginController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Obx(
        () => loginController.isLoading.value
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
                        loginController.login(
                          emailController.text,
                          passwordController.text,
                        );
                      },
                      child: Text("Login"),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offAllNamed(Routes.SIGNUP);
                      },
                      child: Text("Don't have an account? Sign Up"),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
