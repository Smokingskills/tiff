import 'package:tiffin/Onboarding_Info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController
{
  var selecetedPageIndex=0.obs;
  bool get isLastPage => selecetedPageIndex.value == onboardingPages.length - 1;
  var pageController= PageController();

  forwardAction() {
    if (isLastPage) {
      //go to home page
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }
  List<OnboardingInfo> onboardingPages=[
    OnboardingInfo('images/a.png', 'Choose your subscription', 'Now you can choose single day, 30 days tiffin delivery right from your mobile.'),
    OnboardingInfo('images/2.png', 'Choose your time', 'Whether its lunch or dinner we got you covered with our new variety of delicacies.'),
    OnboardingInfo('images/3.png', 'Poll for your favourite items', 'Poll for the items you want to include in the next day menu. The highest polled items will be included in the menu.'),
    OnboardingInfo('images/4.png', 'Chef creating wonders', 'Our chefs will  prepare fresh, healthy and lip smacking delicacies with their magic or you can masala.'),
    OnboardingInfo('images/5.png', 'Super fast delivery', 'Get superfast delivery within the alloted time frame and track our delivery superheros with this app.'),


  ];
}