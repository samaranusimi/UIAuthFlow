import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  var _deviceHeight;
  var _deviceWidth;
  Color _primaryColor = Color.fromRGBO(125, 191, 211, 1.0);
  Color _secondaryColor = Color.fromRGBO(169, 224, 241, 1.0);

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: _primaryColor,
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [_avatarImage(), _emailText(), _password()],
          ),
        ));
  }

  Widget _avatarImage() {
    double circleD = _deviceHeight * 0.25;
    return Container(
      height: circleD,
      width: circleD,
      decoration: BoxDecoration(
          color: _secondaryColor,
          borderRadius: BorderRadius.circular(40),
          image: DecorationImage(
            image: AssetImage('assets/images/avatar.jpeg'),
          )),
    );
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
}
