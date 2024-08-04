import 'package:flutter/material.dart';
import 'package:myapp/utils/form_validation.dart';
import 'package:myapp/widgets/custom_textfield.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:myapp/constants/color.dart';
import 'package:myapp/constants/images.dart';
import 'package:myapp/widgets/custom_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "New Password",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(backgroundImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 20,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 250,
                              child: Text(
                                "Enter new password",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 90),
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomTextField(
                                    hintText: 'Password',
                                    controller: _passwordController,
                                    obscureText: true,
                                    validator: validatePassword,
                                  ),
                                  const SizedBox(height: 16),
                                  CustomTextField(
                                    hintText: 'Confirm Password',
                                    controller: _confirmPasswordController,
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please confirm your password';
                                      }
                                      if (value != _passwordController.text) {
                                        return 'Passwords do not match';
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: CustomButton(
                                      text: "Send",
                                      backgroundColor: primaryColor,
                                      foregroundColor: Colors.white,
                                      onPressed: () {
                                        if (_formKey.currentState?.validate() ==
                                            true) {
                                          print(
                                              'Verification code: ${_passwordController.text}');
                                        }
                                      },
                                      elevation: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
