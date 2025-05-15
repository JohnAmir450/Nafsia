import 'package:flutter/material.dart';
import 'package:nafsia/core/widgets/custom_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewScreen extends StatefulWidget {
  final String paymentToken;

  const PaymentWebViewScreen({super.key, required this.paymentToken});

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  late final WebViewController _controller;
  bool isPaymentSuccessful = false;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition for Android
    // if (Platform.isAndroid) {
    //   WebView.platform = SurfaceAndroidWebView();

    // }
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            print('Finished loading: $url');

            // ✅ Detect Paymob success URL
            if (url.contains("error_occured=false")) {
              setState(() {
                isPaymentSuccessful = true;
              });
              Navigator.of(context).pop(true); // return success
            }

            // 🚫 Detect failure or cancellation (optional)
            if (url.contains("error_occured=true")) {
              Navigator.of(context).pop(false); // return failure
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(
          "https://accept.paymob.com/api/acceptance/iframes/920670?payment_token=${widget.paymentToken}"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context,
          title: 'الدفع', onTap: () => Navigator.of(context).pop(false)),
      body: WebViewWidget(controller: _controller),
    );
  }
}
