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

    return Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 242, 244, 244)
        ),
        
        child:PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SignUpPage(_pageController),
          WelcomePage(_pageController),
          LoginPage(_pageController),
          ResetPasswordPage(_pageController)
        ],
      )
    );
  }
}