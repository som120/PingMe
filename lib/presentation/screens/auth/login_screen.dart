import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pingme/core/common/custom_button.dart';
import 'package:pingme/core/common/custom_text_field.dart';
import 'package:pingme/presentation/screens/auth/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address (e.g., example@email.com)';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  "Welcome to PingMe",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Sign in to continue",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: 30),
                CustomTextField(
                  controller: emailController,
                  hintText: "Email",
                  focusNode: _emailFocus,
                  validator: _validateEmail,
                  prefixIcon: Icon(Icons.email_outlined),
                ),
                SizedBox(height: 16),
                CustomTextField(
                  controller: passwordController,
                  hintText: "Password",
                  focusNode: _passwordFocus,
                  validator: _validatePassword,
                  prefixIcon: Icon(Icons.lock_outline),
                  obscureText: true,
                  suffixIcon: Icon(Icons.visibility),
                ),
                SizedBox(height: 30),
                CustomButton(onPressed: () {}, text: 'Login'),
                SizedBox(height: 20),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account?  ",
                      style: TextStyle(color: Colors.grey[600]),
                      children: [
                        TextSpan(
                          text: " Sign up",
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to signup screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupScreen(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
