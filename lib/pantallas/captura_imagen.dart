import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'analisis_ia.dart';
import 'guia_captura.dart';

class CapturaImagen extends StatefulWidget {
  const CapturaImagen({super.key});

  @override
  _CapturaImagenState createState() => _CapturaImagenState();
}

class _CapturaImagenState extends State<CapturaImagen> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  int _cameraIndex = 0;
  XFile? _imagenCapturada;

  @override
  void initState() {
    super.initState();
    _iniciarCamara();
  }

  Future<void> _iniciarCamara() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isNotEmpty) {
        _controller = CameraController(_cameras[_cameraIndex], ResolutionPreset.high);
        await _controller.initialize();
        setState(() {});
      } else {
        print("No se encontraron cámaras disponibles.");
      }
    } catch (e) {
      print("Error al inicializar la cámara: $e");
    }
  }

  void _alternarCamara() async {
    if (_cameras.length > 1) {
      setState(() {
        _cameraIndex = _cameraIndex == 0 ? 1 : 0;
        _iniciarCamara();
      });
    } else {
      print("Solo hay una cámara disponible.");
    }
  }

  Future<void> _capturarImagen() async {
    try {
      if (_controller.value.isInitialized) {
        XFile foto = await _controller.takePicture();
        setState(() {
          _imagenCapturada = foto;
        });
        print("Foto guardada en: ${foto.path}");
      }
    } catch (e) {
      print("Error al capturar imagen: $e");
    }
  }

  void _simularAnalisis() {
    if (_imagenCapturada != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AnalisisIA(imagenPath: _imagenCapturada!.path)),
      );
    } else {
      print("No hay imagen capturada para analizar.");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Captura de imagen"),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GuiaCaptura()));
            },
            tooltip: "Guía de Captura",
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _controller.value.isInitialized
                  ? Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: CameraPreview(_controller),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          ),
          if (_imagenCapturada != null)
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.file(File(_imagenCapturada!.path), width: 300),
            ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: _alternarCamara,
              tooltip: "Cambiar cámara",
              child: const Icon(Icons.switch_camera),
            ),
            FloatingActionButton(
              onPressed: _capturarImagen,
              tooltip: "Capturar Imagen",
              child: const Icon(Icons.camera),
            ),
            FloatingActionButton(
              onPressed: _simularAnalisis,
              tooltip: "Simular Análisis",
              child: const Icon(Icons.check_circle),
            ),
          ],
        ),
      ),
    );
  }
}
