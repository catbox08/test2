import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'authentication.dart';
import 'widgets.dart';
import 'package:flutter/cupertino.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _remember = false;
  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(),
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Enter your Email',
                hintStyle: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(),
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintText: 'Enter your Password',
                hintStyle: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPass() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        child: Text(
          'Forgot Password ?',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildRememberMe() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _remember,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(
                  () {
                    _remember = value;
                  },
                );
              },
            ),
          ),
          Text(
            'Remember me',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildLogIn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => print('Login Button Pressed'),
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignIn() {
    return Column(
      children: <Widget>[
        Text(
          ' - OR - ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSocial(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: () => print('Login with Facebook'),
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: AssetImage('assets/logos/facebook.jpg'),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocial(
            () => print('Login with Facebook'),
            AssetImage(
              'assets/logos/facebook.jpg',
            ),
          ),
          _buildSocial(
            () => print('Login with Google'),
            AssetImage(
              'assets/logos/google.jpg',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUp() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0XFF61A4F1),
                      Color(0XFF478DE0),
                      Color(0XFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(children: <TextSpan>[
                          TextSpan(
                              text: 'T',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 48)),
                          TextSpan(text: 'o', style: TextStyle(fontSize: 32)),
                          TextSpan(
                              text: 'D',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 48)),
                          TextSpan(text: 'o', style: TextStyle(fontSize: 32)),
                          TextSpan(
                              text: 'L',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 48)),
                          TextSpan(text: 'i', style: TextStyle(fontSize: 32)),
                          TextSpan(text: 's', style: TextStyle(fontSize: 32)),
                          TextSpan(text: 't', style: TextStyle(fontSize: 32)),
                        ]),
                      ),
                      Text(
                        '''


Set your way
        and
                                 take your goals
                                                  ''',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgotPass(),
                      _buildRememberMe(),
                      _buildLogIn(),
                      _buildSignIn(),
                      _buildSocialRow(),
                      _buildSignUp(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
