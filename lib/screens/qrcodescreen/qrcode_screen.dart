import 'package:flutter/material.dart';

import '../../utils/qr_code.dart';

class QrcodeScreen extends StatefulWidget {
  const QrcodeScreen({Key? key, required this.data}) : super(key: key);

  final List<String> data;

  @override
  State<QrcodeScreen> createState() => _QrcodeScreenState();
}

class _QrcodeScreenState extends State<QrcodeScreen> {
  late List<String> _receivedData;

  @override
  void initState() {
    super.initState();
    _receivedData = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 120, left: 40, right: 40),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "QR code",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 30),
                    ),
                    Center(
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
                          onTap: () {},
                          child: Container(
                            child: Image.asset("assets/images/share.png"),
                            height: 64,
                            width: 64,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xff153565)),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text("Partagez")
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
