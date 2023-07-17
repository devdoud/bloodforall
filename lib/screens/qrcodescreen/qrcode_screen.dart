import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

import '../../utils/qr_code.dart';
import '../../utils/utils_functions.dart';

class QrcodeScreen extends StatefulWidget {
  const QrcodeScreen({Key? key, required this.data}) : super(key: key);

  final List<String> data;

  @override
  State<QrcodeScreen> createState() => _QrcodeScreenState();
}

class _QrcodeScreenState extends State<QrcodeScreen> {
  late List<String> _receivedData;
  
  final screenshot = ScreenshotController();

  @override
  void initState() {
    super.initState();
    _receivedData = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 120, left: 40, right: 40),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "QR code",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),
                    ),
                    const Center(
                        child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 60),
                            child: Text(
                              "Presentez ce code a \n un Agent",
                              textAlign: TextAlign.center,
                            ))),
                    MultiDataQRCode(data: _receivedData),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final image = await screenshot.captureFromWidget(QrImage(
          data: _receivedData.join('\n'),
          version: QrVersions.auto,
          size: 200.0,
        ));
              var dateString = DateTime.now()
                  .toIso8601String()
                  .replaceAll(":", "-")
                  .replaceAll(".", "-");
              var imageTitle = "image-$dateString.png";
              UtilsFunction
              .saveAndShare(image, imageTitle);
                          },
                          child: Container(
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xff153565)),
                            child: Image.asset("assets/images/share.png"),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const Text("Partagez")
                      ],
                    )
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
