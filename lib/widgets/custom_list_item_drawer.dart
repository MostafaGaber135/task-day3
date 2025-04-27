import 'package:flutter/material.dart';

class CustomListItemDrawer extends StatelessWidget {
  const CustomListItemDrawer({
    super.key,
    this.title,
    required this.subTitle,
    required this.icon,
  });
  final String? title;
  final String subTitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title!,

            style: TextStyle(
              color: Color(0XFFAFAFAF),
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        Row(
          spacing: 15,
          children: [
            Icon(icon, color: Color(0XFFe0e0e0)),
            Text(
              subTitle,

              style: TextStyle(
                color: Color(0XFFe0e0e0),
                fontFamily: 'Lato',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
