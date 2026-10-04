import 'package:flutter/material.dart';
import 'package:task1/core/theme/app_color.dart';
import 'package:task1/core/widgets/custom_button.dart';
import 'package:task1/core/widgets/custom_text.dart';
import 'package:task1/core/widgets/custom_textfield.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isPasswordVisible = false;

  void login() {
    if (formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: "Welcome Back",size: 30,weight: FontWeight.bold,color: Colors.white,),

              const SizedBox(height: 10),

              CustomText(text: "Login to continue",size: 16,color: Colors.grey.shade300,),

              const SizedBox(height: 40),

              CustomTextfield(hint: "Email", isPassword: false, controller: emailController,),

              const SizedBox(height: 16),

              CustomTextfield(hint: "Password", isPassword: true, controller: passwordController),

              const SizedBox(height: 24),

              CustomButton(text: "Login",onTap: login,color: Colors.white,colorText: AppColors.primary,)
            ],
          ),
        ),
      ),
    );
  }
}