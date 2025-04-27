import 'package:flutter/material.dart';
import 'package:task_day3/screens/home_screen.dart';
import 'package:task_day3/screens/login_screen.dart';
import 'package:task_day3/widgets/custom_elevated_button.dart';
import 'package:task_day3/widgets/custom_social_media_button.dart';
import 'package:task_day3/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const String routeName = '/RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }
    final nameRegex = RegExp(r"^[a-zA-Z\s]+$");
    if (!nameRegex.hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is Empty";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is Empty";
    }
    if (value != _passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  color: Color(0XFFe0e0e0),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Username',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0XFFe0e0e0),
                ),
              ),

              CustomTextField(
                hintText: "UserName",
                controller: _usernameController,
                validator: _validateUserName,
              ),
              Text(
                'Password',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0XFFe0e0e0),
                ),
              ),
              CustomTextField(
                hintText: "Password",
                obscureText: true,
                isPassword: true,
                controller: _passwordController,
                validator: _validatePassword,
              ),
              Text(
                'Confirm Password',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0XFFe0e0e0),
                ),
              ),
              CustomTextField(
                hintText: "Confirm Password",
                obscureText: true,
                isPassword: true,
                controller: _confirmPasswordController,
                validator: _validateConfirmPassword,
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  textBtn: 'Register',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder:
                              (_) => HomeScreen(
                                userName: _usernameController.text.trim(),
                              ),
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(height: 10),
              Row(
                spacing: 4,
                children: [
                  Text(
                    'ـــــــــــــــــــــــــــــــــــــــــــــــــــــــ',
                    style: TextStyle(color: Color(0XFF979797)),
                  ),
                  Text(
                    'or',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0XFF979797),
                    ),
                  ),
                  Text(
                    'ـــــــــــــــــــــــــــــــــــــــــــــــــــــــ',
                    style: TextStyle(color: Color(0XFF979797)),
                  ),
                ],
              ),
              SizedBox(height: 30),
              CustomSocialMediaButton(
                text: 'Login with Google',
                image: 'assets/images/google.png',
              ),
              SizedBox(height: 30),
              CustomSocialMediaButton(
                text: 'Login with Apple',
                image: 'assets/images/apple.png',
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0XFF979797),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(LoginScreen.routeName);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color(0XFFe0e0e0),
                      ),
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
