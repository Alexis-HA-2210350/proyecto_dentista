import 'package:flutter/material.dart';
import 'captura_imagen.dart';  // Importamos la pantalla de captura de imagen

class PantallaPrincipal extends StatelessWidget {
  const PantallaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Proyecto Dentista")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bienvenido a la app de diagnóstico dental",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CapturaImagen()),
                );
              },
              child: Text("Capturar Imagen"),
            ),
          ],
        ),
      ),
    );
  }
}
