import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  int counter = 1;
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.resumeCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Column(
            children: [
              Center(
                child: (result != null)
                    ? const Text('Scan reussi')
                    : const Text('Scanner un code'),
              ),
              if (result != null && result!.code!.contains("Medisecure"))
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                  child: ElevatedButton(onPressed: (){
                    // messageDialog(context, result!.code!);
                  }, child: const Text("Afficher")),
                ),
            ],
          )
        ],
      ),
    );
  }

  // Future<dynamic> messageDialog(
  //     BuildContext context, String value) {
  //   return showDialog(
  //       context: context,
  //       builder: (context) => Dialog(
  //               child: Container(
  //             padding: const EdgeInsets.all(12.0),
  //             width: double.infinity,
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(6.0),
  //             ),
  //             child: Column(mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 AppButton(
  //                   width: double.maxFinite,
  //                   text: "Informations",
  //                   onTap: () {
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => const InfoPatientScreen()));
  //                   },
  //                 ),12.height,
  //                 AppButton(
  //                   width: double.maxFinite,
  //                   text: "Antecedents",
  //                   onTap: () {
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => const AntecedentScreen()));
  //                   },
  //                 ),12.height,
  //                 AppButton(
  //                   width: double.maxFinite,
  //                   text: "Prescription",
  //                   onTap: () {
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => const PrescriptionScreen()));
  //                   },
  //                 ),12.height,
  //                 AppButton(
  //                   width: double.maxFinite,
  //                   text: "Bilan",
  //                   onTap: () {
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => const BilanScreen()));
  //                   },
  //                 ),12.height,
  //                 AppButton(
  //                   width: double.maxFinite,
  //                   text: "Consulter la Fiche",
  //                   onTap: () {
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => const ConsultFicheScreen()));
  //                   },
  //                 ),
  //               ],
  //             ),
  //           ),
  //           ));
  // }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
