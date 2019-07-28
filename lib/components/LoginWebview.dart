import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class LoginWebview extends StatelessWidget {

  final String loginUrl = 'https://www.reddit.com/api/v1/authorize?client_id=QDDjDJF1y_mKyA&response_type=code&state=mkel&redirect_uri=https%3A%2F%2Fmoonbison.com%2Fkarmello%2Fauth&duration=permanent&scope=identity,edit,flair,history,modconfig,modflair,modlog,modposts,modwiki,mysubreddits,privatemessages,read,report,save,submit,subscribe,vote,wikiedit,wikiread';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebviewScaffold(
        url: loginUrl,
      )
    );
  }
}