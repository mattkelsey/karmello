import 'package:flutter/material.dart';
import 'package:karmello/components/LoginWebview.dart';
import 'package:karmello/home.dart';
import 'package:karmello/login.dart';
import 'package:karmello/services/token.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: (TokenProvider.getToken() == "" || TokenProvider.getToken() == null) ? '/login' : '/',
      routes: {
        '/': (_) => HomePage(),
        '/login': (_) => Login(),
        '/login-webview': (_) => LoginWebview(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
    );
  }
}