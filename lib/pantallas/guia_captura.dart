import 'package:flutter/material.dart';

class GuiaCaptura extends StatefulWidget {
  const GuiaCaptura({super.key});

  @override
  _GuiaCapturaState createState() => _GuiaCapturaState();
}

class _GuiaCapturaState extends State<GuiaCaptura> {
  int pasoActual = 0;
  final List<String> pasos = [
    "1️⃣ Enciende la cámara y coloca el teléfono frente a tu rostro.",
    "2️⃣ Asegúrate de que la iluminación sea suficiente.",
    "3️⃣ Captura una imagen de frente con la boca abierta.",
    "4️⃣ Toma una foto lateral mostrando los dientes de perfil.",
    "5️⃣ Sube una imagen de tu radiografía si la tienes."
  ];

  void siguientePaso() {
    setState(() {
      if (pasoActual < pasos.length - 1) {
        pasoActual++;
      } else {
        Navigator.pop(context); // Cierra la guía cuando el usuario termine
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Guía para Captura")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              pasos[pasoActual],
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: siguientePaso,
              child: Text(pasoActual < pasos.length - 1 ? "Siguiente Paso" : "Finalizar"),
            ),
          ],
        ),
      ),
    );
  }
}
