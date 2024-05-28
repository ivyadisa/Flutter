import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  void _navigateToNextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      // Handle the last page action (e.g., navigate to the home screen)
    }
  }

  void _navigateToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  Widget _buildPage({
    required String heading,
    required String paragraph,
    required List<String> images,
    required bool showPreviousButton,
    required bool showNextButton,
    required bool showEnterButton,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...images.map((image) => Image.asset(image, height: 100)).toList(),
        SizedBox(height: 20),
        Text(
          heading,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF02282D),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            paragraph,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF02282D),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (showPreviousButton)
              ElevatedButton(
                onPressed: _navigateToPreviousPage,
                child: Text('Prev'),
              ),
            if (showNextButton)
              ElevatedButton(
                onPressed: _navigateToNextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF6600),
                ),
                child: Row(
                  children: [
                    Text('Next'),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            if (showEnterButton)
              ElevatedButton(
                onPressed: () {
                  // Navigate to the home screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF6600),
                ),
                child: Row(
                  children: [
                    Text('Enter'),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          _buildPage(
            heading: 'Take Control of your system',
            paragraph: 'With various features you can customize according to your creation.',
            images: ['images/page1.png'],
            showPreviousButton: false,
            showNextButton: true,
            showEnterButton: false,
          ),
          _buildPage(
            heading: 'Task Management',
            paragraph: 'Manage Your Tasks quickly and efficiently for better results',
            images: ['images/page2.png'],
            showPreviousButton: true,
            showNextButton: true,
            showEnterButton: false,
          ),
          _buildPage(
            heading: 'Structural Organization',
            paragraph: 'Work more Structured and organized for better work flow',
            images: ['images/page3.png'],
            showPreviousButton: true,
            showNextButton: false,
            showEnterButton: true,
          ),
        ],
      ),
    );
  }
}
