import 'package:flutter/material.dart';
import 'package:myapp/constants/color.dart';
import 'package:myapp/constants/images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/register_screen.dart';
import 'package:myapp/widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 20,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          // Center widget added here
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Centers the content vertically
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                welcomeScreenIcon,
                width: 250,
              ),
              const SizedBox(height: 10),
              const Text(
                "Give Blood. Rewrite someone’s story.",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "In every drop of blood, there’s a heartbeat of humanity. Join Pulsease, and let’s embody the spirit of giving, together!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "Login",
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 2,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomButton(
                      text: "Register",
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 0,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
