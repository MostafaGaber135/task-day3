import 'package:flutter/material.dart';

class CustomSocialMediaButton extends StatelessWidget {
  const CustomSocialMediaButton({
    super.key,
    required this.text,
    required this.image,
  });
  final String text, image;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(327, 48),
        side: BorderSide(color: Color(0XFF8875FF)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      onPressed: () {},
      child: Row(
        spacing: 10,
        children: [
          Spacer(),
          Image.asset(image),
          Text(
            text,

            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Color(0XFFe0e0e0),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
