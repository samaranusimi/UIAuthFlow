// ignore_for_file: must_be_immutable


import 'package:flutter/material.dart';
import 'package:uiauthflow/pages/login_page.dart';
import 'package:uiauthflow/utils/animations/login_page_animation.dart';
import 'package:uiauthflow/utils/pageroute/slide_page_animation.dart';
// import 'package:flutter/widgets.dart';

class AnimatedHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimatedHomePageState();
  }
}

class AnimatedHomePageState extends State<AnimatedHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
        reverseDuration: Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _HomePage(_controller);
  }
}

class _HomePage extends StatelessWidget {
  var _deviceHeight;
  var _deviceWidth;

  late AnimationController _controller;
  late EnterAnimation _animation;
  _HomePage(this._controller) {
    _animation = EnterAnimation(_controller);
    _controller.forward();
  }

  Color _primaryColor = Color.fromRGBO(125, 191, 211, 1.0);
  Color _secondaryColor = Color.fromRGBO(169, 224, 241, 1.0);
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: _deviceHeight * 0.60,
          width: _deviceWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              _avatarImage(),
              _name(),
              SizedBox(height: _deviceHeight * 0.10),
              _logoutButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarImage() {
    double circleD = _deviceHeight * 0.25;
    return AnimatedBuilder(
        animation: _animation.controller,
        builder: (_context, _widget) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.diagonal3Values(
                _animation.circleSize.value, _animation.circleSize.value, 1),
            child: Container(
              height: circleD,
              width: circleD,
              decoration: BoxDecoration(
                  color: _secondaryColor,
                  borderRadius: BorderRadius.circular(300),
                  image: DecorationImage(
                      image: AssetImage("assets/images/avatar.jpeg"))),
            ),
          );
        });
  }

  Widget _name() {
    return Container(
      child: Text(
        "Jhon dee",
        style: TextStyle(
            color: _primaryColor, fontSize: 35, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _logoutButton(BuildContext _context) {
    return Container(
      child: MaterialButton(
        height: _deviceHeight * 0.05,
        minWidth: _deviceWidth * 0.30,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: _primaryColor, width: 3),
            borderRadius: BorderRadius.circular(25)),
        child: Text(
          "Logout",
          style: TextStyle(color: _primaryColor, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.push(_context,
          SlidePageRoute(AnimatedLoginPage()
          ),
          );   
        },
      ),
    );
  }
}
