import 'package:adventur_ads/global/components/text_app_bold.dart';
import 'package:adventur_ads/global/utils/color_app.dart';
import 'package:adventur_ads/modules/admob/controller/admob_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final cont = Get.put(AdmobController());
  late WebViewController controller;
  bool _showResultButton = false;

  bool isControllerInitialized = false;
  late InAppWebViewController _webViewController;
  String _dataFromWeb = '';

  @override
  void initState() {
    // startWebView();
    controller = WebViewController();
    super.initState();
  }

  void startWebView() async {
    String fileText = await rootBundle.loadString('assets/games/target.html');
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadHtmlString(fileText); // Load HTML string
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InAppWebView(
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                javaScriptEnabled: true,
              ),
            ),
            onWebViewCreated: (InAppWebViewController controller) {
              _webViewController = controller;
              _loadLocalHtml();
            },
            onLoadStop: (controller, url) async {
              controller.addJavaScriptHandler(
                handlerName: 'gameResultHandler',
                callback: (data) {
                  setState(() {
                    _dataFromWeb = data[0].toString();
                    print('AAAAAAAAAAAAAA');
                    print("Game Result: $_dataFromWeb");
                    _showResultButton = true;

                    // cont.showRewardedAd();
                  });
                },
              );
            },
          ),
          if (_showResultButton) _buildResultOverlay(),
        ],
      ),
    );
  }

  void _loadLocalHtml() async {
    var fileUrl = await rootBundle.loadString('assets/games/target.html');
    _webViewController.loadFile(assetFilePath: 'assets/games/target.html');
  }

  Widget _buildResultOverlay() {
    return Container(
      color: Colors.black.withOpacity(0.5), // Shaded background
      child: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            color: Colors.white,
            onPressed: () {},
            icon: Icon(Icons.close),
            iconSize: 40,
          ),
          Image.asset('assets/images/test3.jpg', width: 200, height: 200),
          const SizedBox(
            height: 60,
          ),
          Center(
              child: textBold(
                  text: 'Congratulations you won',
                  color: ColorManager.white,
                  fontWeight: FontWeight.w400,
                  sizeFont: 24)),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _showResultButton = false;
                cont.showRewardedAd();
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorManager.pink),
              width: 300,
              height: 50,
              child: Center(
                  child: textBold(
                      text: 'Collect points now!', color: ColorManager.white)),
            ),
          ),
        ],
      )),
    );
  }
}
