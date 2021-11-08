import 'package:flutter/material.dart';

import 'package:nous/ui/homepage/signup_page.dart';
import 'package:nous/ui/homepage/welcome_page.dart';
import 'package:nous/ui/homepage/login_page.dart';
import 'package:nous/ui/homepage/reset_password_page.dart';

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
        ResetPasswordPage(_pageController)
      ],
    );
  }
}