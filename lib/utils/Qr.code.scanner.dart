import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QRCodeScanner {
  static Future<String> scan() async{
    String code = await FlutterBarcodeScanner.scanBarcode("#ff6666", "Cancelar", true, ScanMode.QR);
    return code; 
  }
}