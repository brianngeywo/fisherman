import 'package:flutter/material.dart';

PageController pageController = PageController();

void onAddButtonTapped(int index) {
  // use this to animate to the page
  pageController.animateToPage(
    index,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );

  // or this to jump to it without animating
  // pageController.jumpToPage(index);
}
