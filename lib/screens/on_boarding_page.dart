import 'package:flutter/material.dart';

class OnBoardPage extends StatelessWidget {
  final String imagePath, title, description;
  final int currentPage, totalPages;

  const OnBoardPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Image.asset(imagePath, height: 277.78, width: 213),

        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            totalPages,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              width: 26.28,
              height: 4,
              decoration: BoxDecoration(
                color: currentPage == index ? Colors.white : Color(0XFFAFAFAF),
                borderRadius: BorderRadius.circular(56),
              ),
            ),
          ),
        ),

        const SizedBox(height: 30),
        Text(
          title,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Color(0XFFe0e0e0),
            fontFamily: 'Lato',
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0XFFe0e0e0),
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
