import 'package:flutter/material.dart';
import 'package:task_day3/screens/login_screen.dart';
import 'package:task_day3/screens/register_screen.dart';
import 'package:task_day3/widgets/custom_elevated_button.dart';
import 'package:task_day3/widgets/custom_outlined_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  static const String routeName = '/StartScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_outlined, size: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 55),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'Welcome to UpTodo',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  color: Color(0XFFe0e0e0),
                ),
              ),
            ),
            Center(
              heightFactor: 3,
              child: Text(
                'Please login to your account or create new account to continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0XFFb1b1b1),
                ),
              ),
            ),
            Spacer(),
            CustomElevatedButton(
              textBtn: 'LOGIN',
              onPressed: () {
                Navigator.of(
                  context,
                ).pushReplacementNamed(LoginScreen.routeName);
              },
            ),
            SizedBox(height: 30),
            CustomOutlinedButton(
              textBtn: 'Create account'.toUpperCase(),
              onPressed: () {
                Navigator.of(
                  context,
                ).pushReplacementNamed(RegisterScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
