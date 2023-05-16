import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //değişkenler
  String gecmis = "";
  String sonuc = "";

  void tiklama(var butonDegeri) { //tıklama olayı

    if (butonDegeri == "C") { //gönderilen değer C ise ekranı temizle
      gecmis = "";
      sonuc = "";
    } 
    else if (butonDegeri == "=") { // bu kısmı youtubeden gördüm math_expressions adında paket varmış onu kullandım biraz dökümanı okudum biraz da youtubeden bakarak yazdım
      String girilenDeger = gecmis;
      girilenDeger = gecmis.replaceAll("x", "*");
      Parser p = Parser();
      Expression expression = p.parse(girilenDeger);
      ContextModel cm = ContextModel();
      var sonDeger = expression.evaluate(EvaluationType.REAL, cm);
      sonuc = sonDeger.toString();
    } else {
      gecmis = gecmis + butonDegeri;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Hesap Makinesi'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      gecmis,
                      style: const TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      sonuc,
                      style: const TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                buton(sayi: "+"),
                buton(sayi: "-"),
                buton(sayi: "x"),
                buton(sayi: "/")
              ],
            ),
            Row(
              children: [
                buton(sayi: "6"),
                buton(sayi: "7"),
                buton(sayi: "8"),
                buton(sayi: "9")
              ],
            ),
            Row(
              children: [
                buton(sayi: "2"),
                buton(sayi: "3"),
                buton(sayi: "4"),
                buton(sayi: "5")
              ],
            ),
            Row(
              children: [
                buton(sayi: "1"),
                buton(sayi: "0"),
                buton(sayi: "C"),
                buton(sayi: "=")
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buton({String sayi = ""}) { //butonları teker teker yazmak yerine bir kere widget oluşturdum ve böyle kullandım
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(20),
              backgroundColor: Colors.black26),
          onPressed: () => tiklama(sayi),
          child: Text(sayi),
        ),
      ),
    );
  }
}
