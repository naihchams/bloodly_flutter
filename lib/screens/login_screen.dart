import 'package:flutter/material.dart';
import 'package:myapp/constants/color.dart';
import 'package:myapp/constants/images.dart';
import 'package:myapp/screens/register_screen.dart';
import 'package:myapp/utils/form_validation.dart';
import 'package:myapp/widgets/custom_button.dart';
import 'package:myapp/widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 50,
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Login here",
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(
                    width: 250,
                    child: Text(
                      "Welcome back, you've been missed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          hintText: 'Email',
                          controller: _emailController,
                          validator: validateEmail,
                        ),
                        const SizedBox(height: 16),
                        CustomTextField(
                          hintText: 'Password',
                          controller: _passwordController,
                          obscureText: true,
                          validator: validatePassword,
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              
                            },
                            child: const Text(
                              "Forgot your password?",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Expanded(
                            child: CustomButton(
                              text: "Sign In",
                              backgroundColor: primaryColor,
                              foregroundColor: Colors.white,
                              onPressed: () {
                                if (_formKey.currentState?.validate() == true) {
                                  print('Email: ${_emailController.text}');
                                  print(
                                      'Password: ${_passwordController.text}');
                                }
                              },
                              elevation: 2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            "Create new account",
                            style: TextStyle(
                              color: darkGreyColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        const Text(
                          "Or continue with",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: SizedBox(
                            width: 200,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: greyColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      googleIcon,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: greyColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      facebookIcon,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: greyColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Image.asset(
                                      appleIcon,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
