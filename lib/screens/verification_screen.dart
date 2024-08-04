import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:myapp/constants/color.dart';
import 'package:myapp/constants/images.dart';
import 'package:myapp/widgets/custom_button.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});

  final _pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Verify Profile",
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
                                "Enter Verification Code",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 90),
                            Form(
                              key: _formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PinCodeTextField(
                                    appContext: context,
                                    length: 4,
                                    controller: _pinController,
                                    onChanged: (value) {},
                                    pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.circle,
                                      fieldHeight: 60,
                                      fieldWidth: 60,
                                      activeColor: primaryColor,
                                      inactiveColor: primaryColor,
                                      borderWidth: 1,
                                      selectedColor: primaryColor,
                                      selectedFillColor: secondaryColor,
                                      inactiveFillColor: Colors.transparent,
                                      activeFillColor: Colors.transparent,
                                    ),
                                    backgroundColor: Colors.transparent,
                                    keyboardType: TextInputType.number,
                                    animationType: AnimationType.fade,
                                    cursorColor: primaryColor,
                                    textStyle: const TextStyle(
                                      color: primaryColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          value.length < 4) {
                                        return "Enter complete verification code";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Didn't receive a code?",
                                          style: TextStyle(
                                            color: darkGreyColor,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: const Text("Resend",
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontWeight: FontWeight.w600)),
                                        ),
                                      ],
                                    ),
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
                                              'Verification code: ${_pinController.text}');
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
