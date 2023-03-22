import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/services/services.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({super.key});

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {

  late TextEditingController code;

  @override
  void initState() {
    super.initState();
    code = TextEditingController(text: (LocalSharedPreferences.prefs.containsKey('code') ? "${LocalSharedPreferences.prefs.getString('code')}" : null));
  }

  @override
  void dispose() {
    code.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
        child: Column(
          children: [

            Padding(padding: EdgeInsets.only(top: alto * 0.1)),

            const Text(
              "CÓDIGO DE PACIENTE",
              textAlign: TextAlign.center,
              textScaleFactor: 1.3,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Image.asset(
              "assets/images/codigo.png",
              width: double.infinity,
              height: ancho * 0.3,
            ),

            Padding(padding: EdgeInsets.only(top: alto * 0.03)),

            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CupertinoTextField.borderless(
                    controller: code,
                    cursorColor: Colors.black,
                    padding: const EdgeInsets.only(left: 65, top: 10, right: 6, bottom: 10),
                    prefix: const Text("Código", style: TextStyle(fontWeight: FontWeight.bold)),
                    placeholder: "ABC123",
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: ancho * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [

            CupertinoButton(
              onPressed: () {
                LocalSharedPreferences.prefs.setString('code', code.text);
                Navigator.pushNamed(context, 'datescreen');
              },
              color: Colors.green,
              padding: EdgeInsets.only(top: alto * 0.015, bottom: alto * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Continuar", textScaleFactor: 1.2),
                  Padding(padding: EdgeInsets.only(left: ancho * 0.02)),
                  const Icon(Icons.arrow_forward),
                ],
              ),
            ),

            Padding(padding: EdgeInsets.only(bottom: alto * 0.05)),
            
          ],
        ),
      ),
    );
  }
}
