library page_transition_effects;

import 'package:flutter/material.dart';

enum AnimationType { normal, fadeIn, slideUp, slideDown, slideLeft, slideRight }

class PageTransitionEffects {
  final BuildContext context;
  final Widget page;
  final AnimationType animation;
  final Duration duration;
  final bool replacement;

  PageTransitionEffects({
    required this.context,
    required this.page,
    this.animation = AnimationType.normal,
    this.duration = const Duration(milliseconds: 300),
    this.replacement = false,
  }) {
    switch (animation) {
      case AnimationType.normal:
        _normalTransition();
        break;
      case AnimationType.fadeIn:
        _fadeInTransition();
        break;
      case AnimationType.slideUp:
        _slideUpTransition();
        break;
      case AnimationType.slideDown:
        _slideDownTransition();
        break;
      case AnimationType.slideLeft:
        _slideLeftTransition();
        break;

      case AnimationType.slideRight:
        _slideRightTransition();
        break;

      default:
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    }
  }

  void _pushPage(Route route) => Navigator.push(context, route)
      .then((value) => debugPrint("PTE => $value"));

  void _pushReplacementPage(Route route) =>
      Navigator.pushReplacement(context, route);

  void _normalTransition() {
    final route = MaterialPageRoute(builder: (context) => page);
    replacement ? _pushReplacementPage(route) : _pushPage(route);
    debugPrint("PTE => Normal");
  }

  void _fadeInTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOut),
        ),
        child: page,
      ),
    );

    replacement ? _pushReplacementPage(route) : _pushPage(route);
    debugPrint("PTE => fadeIn");
  }

  void _slideUpTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
            .animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOut),
        ),
        child: page,
      ),
    );

    replacement ? _pushReplacementPage(route) : _pushPage(route);
    debugPrint("PTE => slideUp");
  }

  void _slideDownTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(0.0, -1.0), end: Offset.zero)
                .animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOut),
        ),
        child: page,
      ),
    );

    replacement ? _pushReplacementPage(route) : _pushPage(route);
    debugPrint("PTE => slideDown");
  }

  void _slideLeftTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
            .animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOut),
        ),
        child: page,
      ),
    );

    replacement ? _pushReplacementPage(route) : _pushPage(route);
    debugPrint("PTE => slideLeft");
  }

  void _slideRightTransition() {
    final route = PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position:
            Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
                .animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOut),
        ),
        child: page,
      ),
    );

    replacement ? _pushReplacementPage(route) : _pushPage(route);
    debugPrint("PTE => slideRight");
  }
}
