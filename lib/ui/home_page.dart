import 'package:flutter/material.dart';
import 'package:nous/ui/login_page.dart';
import 'package:nous/ui/welcome_page.dart';
import 'package:nous/ui/signup_page.dart';

class HomePage extends StatelessWidget
{
  HomePage();

  @override
  Widget build(BuildContext context)
  {
    final _pageController = PageController(initialPage: 1);

    return PageView(
      controller: _pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SignUpPage(_pageController),
        WelcomePage(_pageController),
        LoginPage(_pageController),
      ],
    );
  }
}