import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:karmello/services/token.dart';

class Login extends StatelessWidget {
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  _launchLoginPage (dynamic context) {
    Navigator.pushNamed(context, '/login-webview');

    flutterWebviewPlugin.onUrlChanged.listen((String url) {
      if (url.contains('moonbison.com/karmello/auth')) {
        flutterWebviewPlugin.close();
        Navigator.pushReplacementNamed(context, '/');
        TokenProvider.setTokenFromCode(Uri.parse(url).queryParameters['code']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to",
              style: TextStyle(
                fontSize: 30,
                color: Colors.grey[600]
              ),
            ),
            Text(
              "Karmello",
              style: TextStyle(
                fontSize: 70,
                fontFamily: 'PermanentMarker',
                color: Colors.cyan[100]
              ),
            ),
            RaisedButton(
              child: Text('Login with Reddit'),
              elevation: 5.0,
              onPressed: () => _launchLoginPage(context),
            )
          ],
        ),
      ),
    );
  }
}