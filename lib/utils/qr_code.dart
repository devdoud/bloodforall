import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MultiDataQRCode extends StatelessWidget {
  final List<String> data; // Liste des données à inclure dans le QR code

  const MultiDataQRCode({super.key, required this.data});

  void _showQRData(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Données du QR Code'),
          content: Text("$data"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fermer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String combinedData = data.join(
        '\n'); // Combinez les données en les séparant par une nouvelle ligne

    return Center(
        child: Column(
      children: [
        QrImage(
          data: combinedData,
          version: QrVersions.auto,
          size: 200.0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 20),
          child: ElevatedButton(
            onPressed: () => _showQRData(context),
            child: const Text('Afficher les données'),
          ),
        ),
      ],
    ));
  }
}
