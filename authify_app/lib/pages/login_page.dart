import 'package:authify_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/animations/animation.dart';

class AnimatedLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AnimatedLoginPageState();
  }
}

class AnimatedLoginPageState extends State<AnimatedLoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2),
        reverseDuration: Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginPage(_controller);
  }
}

class LoginPage extends StatelessWidget {
  late double _deviceHeight;
  late double _deviceWidth;
  Color _primaryColor = Color.fromRGBO(125, 191, 211, 1.0);
  Color _secondaryColor = Color.fromRGBO(169, 224, 241, 1.0);

  late AnimationController _controller;
  late EnterAnimation _animation;

  LoginPage(_controller) {
    _controller = _controller;
    _animation = EnterAnimation(_controller);
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: _primaryColor,
        body: Align(
          alignment: Alignment.center,
          child: Container(
            height: _deviceHeight * 0.60,
            width: _deviceWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                _avatarImage(),
                SizedBox(height: _deviceHeight * 0.05),
                _emailText(),
                _password(),
                SizedBox(
                  height: _deviceHeight * 0.10,
                ),
                _loginButton(context)
              ],
            ),
          ),
        ));
  }

  Widget _avatarImage() {
    double circleD = _deviceHeight * 0.25;
    return AnimatedBuilder(
        animation: _animation.controller,
        builder: (BuildContext _context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.diagonal3Values(
                _animation.circleSize.value, _animation.circleSize.value, 1),
            child: Container(
              height: circleD,
              width: circleD,
              decoration: BoxDecoration(
                color: _secondaryColor,
                borderRadius: BorderRadius.circular(400),
                image: DecorationImage(
                  image: AssetImage('assets/images/avatar.jpeg'),
                ),
              ),
            ),
          );
        });
  }

  Widget _emailText() {
    return Container(
      width: _deviceWidth * 0.70,
      child: TextField(
        autocorrect: false,
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: "Enter your email",
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }

  Widget _password() {
    return Container(
        width: _deviceWidth * 0.70,
        child: TextField(
          obscureText: true,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
              hintText: "Password",
              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white))),
        ));
  }

  Widget _loginButton(BuildContext _context) {
    return MaterialButton(
      minWidth: _deviceWidth * 0.38,
      height: _deviceHeight * 0.055,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Colors.white)),
      child: Text(
        "Login",
        style: TextStyle(
          color: _primaryColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Navigator.pushReplacement(_context,
            MaterialPageRoute(builder: (BuildContext _context) {
          return HomePage();
        }));
      },
    );
  }
}
