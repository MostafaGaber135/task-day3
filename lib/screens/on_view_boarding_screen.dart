import 'package:flutter/material.dart';
import 'package:task_day3/screens/start_screen.dart';
import 'package:task_day3/screens/on_boarding_page.dart';

class OnViewBoardingScreen extends StatefulWidget {
  const OnViewBoardingScreen({super.key});
  static const String routeName = '/OnViewBoardingScreen';
  @override
  State<OnViewBoardingScreen> createState() => _OnViewBoardingScreenState();
}

class _OnViewBoardingScreenState extends State<OnViewBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _onBoardData = [
    {
      "image": "assets/images/Group 182.png",
      "title": "Manage your tasks",
      "description":
          "You can easily manage all of your daily tasks in DoMe for free.",
    },
    {
      "image": "assets/images/Frame 162.png",
      "title": "Create daily routine",
      "description":
          "In UpTodo you can create your personalized routine to stay productive.",
    },
    {
      "image": "assets/images/Frame 161.png",
      "title": "Organize your tasks",
      "description":
          "You can organize your daily tasks by adding your tasks into separate categories.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "SKIP",
                        style: TextStyle(
                          color: Color(0XFF7a7a7a),
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _onBoardData.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder:
                        (context, index) => OnBoardPage(
                          title: _onBoardData[index]["title"]!,
                          description: _onBoardData[index]["description"]!,
                          imagePath: _onBoardData[index]["image"]!,
                          currentPage: _currentPage,
                          totalPages: _onBoardData.length,
                        ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed:
                            _currentPage > 0
                                ? () {
                                  _pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                }
                                : null,
                        child: const Text(
                          "BACK",
                          style: TextStyle(
                            color: Color(0XFF7a7a7a),
                            fontSize: 16,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0XFF8875FF),
                          minimumSize: Size(90, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () {
                          if (_currentPage == _onBoardData.length - 1) {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(StartScreen.routeName);
                          } else {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            );
                          }
                        },
                        child: Text(
                          _currentPage == _onBoardData.length - 1
                              ? "GET STARTED"
                              : "NEXT",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
