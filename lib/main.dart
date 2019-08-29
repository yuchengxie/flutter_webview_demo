import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WebViewController _controller;

  showToast(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 2,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    JavascriptChannel _alertJavascriptChannel(BuildContext context) {
      return JavascriptChannel(
          name: 'Toast',
          onMessageReceived: (JavascriptMessage message) {
            showToast(message.message);
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('WebView Test'),
      ),
      // body: RaisedButton(
      //   child: Text('点击按钮'),
      //   onPressed: () {
      //    showToast("hahah");
      //   },
      // )
      body: WebView(
        // initialUrl: 'http://www.baidu.com',
        initialUrl: 'http://localhost:8080/',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller = webViewController;
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('js://webview')) {
            // print('JS调用了 flutter by navigationDelegate');
            showToast('调用了原生哦，😄😄');
            // showToast('JS调用了 flutter by navigationDelegate:${request.url}');
            return NavigationDecision.prevent; //阻止路由替換
          }
          // print('allowing navigation to $request');
          return NavigationDecision.navigate; //允许路由替換
        },
        javascriptChannels: <JavascriptChannel>[
          _alertJavascriptChannel(context),
        ].toSet(),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: () {
          _controller
              ?.evaluateJavascript('callJS("visible")')
              ?.then((result) {
                  // You can handle JS result here.
              });
        },
        child: Text('原生调用Js'),
      ),
    );
  }
}
