import 'package:authify_app/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  var _deviceHeight;
  var _deviceWidth;

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
    return Container(
      height: circleD,
      width: circleD,
      decoration: BoxDecoration(
          color: _secondaryColor,
          borderRadius: BorderRadius.circular(300),
          image:
              DecorationImage(image: AssetImage("assets/images/avatar.jpeg"))),
    );
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
          Navigator.pushReplacement(_context,
              MaterialPageRoute(builder: (BuildContext _context) {
            return AnimatedLoginPage();
          }));
        },
      ),
    );
  }
}
