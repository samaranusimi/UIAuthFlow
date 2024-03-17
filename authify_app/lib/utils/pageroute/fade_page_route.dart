import 'package:flutter/material.dart';

class FadePageRoute extends PageRouteBuilder {
  // ignore: unused_field
  final Widget _child;
  FadePageRoute(this._child)
      : super(
          transitionDuration: Duration(seconds: 2),
          transitionsBuilder: (BuildContext _context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          pageBuilder: (BuildContext _context, animation, secondaryAnimation) {
            return _child;
          },
        );
}
