import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  // ignore: unused_field
  final Widget _child;

  SlidePageRoute(this._child)
      : super(
            transitionDuration: Duration(milliseconds: 500),
            transitionsBuilder: (BuildContext _context,
                Animation<double> animation,
                Animation secondanimation,
                Widget child) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
                    .animate(animation),
                child: _child,
              );
            },
            pageBuilder: (BuildContext _context, Animation animation,
                Animation secondanimation) {
              return _child;
            });
}
