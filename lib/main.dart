import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'authentication.dart';
import 'widgets.dart';
import 'package:flutter/cupertino.dart';
import 'LoginPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TodoList',
      theme: ThemeData(
        primaryColor: Color(0xFF000000),
      ),
      onGenerateRoute: (setting) {
        return MaterialPageRoute(builder: (context) => LoginScreen());
      },
    );
  }
}
