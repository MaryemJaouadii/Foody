import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class RecipeView extends StatefulWidget {
  final String postUrl;
  const RecipeView(this.postUrl) ;

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {


  late String finalUrl;
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    if(widget.postUrl.contains("http://")) {
      finalUrl=widget.postUrl.replaceAll("http://", "https://");
    }
    else {
      finalUrl = widget.postUrl;
    }

    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: kIsWeb? MainAxisAlignment.start: MainAxisAlignment.end,
                  children: [
                    Text(
                      'AppGuy',
                    ),
                    Text('Recipes')
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl: finalUrl,
                  onWebViewCreated: (WebViewController webViewController) {
                    setState(() {
                      _controller.complete(webViewController);

                    });
                  },


                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
