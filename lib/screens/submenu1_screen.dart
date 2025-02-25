// lib/screens/submenu1_screen.dart
// Esta es la pantalla para el Submenú 1

import 'package:flutter/material.dart';

// Submenu1Screen es un StatefulWidget que muestra el contenido del Submenú 1
class Submenu1Screen extends StatefulWidget {
  const Submenu1Screen({Key? key}) : super(key: key);

  @override
  State<Submenu1Screen> createState() => _Submenu1ScreenState();
}

class _Submenu1ScreenState extends State<Submenu1Screen> {
  // Variable para controlar el estado de una funcionalidad simple
  bool _isActivated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submenú 1'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ícono que cambia según el estado
            Icon(
              _isActivated ? Icons.check_circle : Icons.cancel,
              size: 100,
              color: _isActivated ? Colors.green : Colors.red,
            ),
            const SizedBox(height: 20),
            // Mensaje que cambia según el estado
            Text(
              _isActivated ? '¡Función Activada!' : 'Función Desactivada',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            // Botón para cambiar el estado
            ElevatedButton(
              onPressed: () {
                // Cuando se presiona el botón, llamamos a setState
                // setState informa a Flutter que el estado ha cambiado
                // y debe reconstruir el widget con los nuevos valores
                setState(() {
                  // Invertimos el valor de _isActivated
                  _isActivated = !_isActivated;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text(
                _isActivated ? 'Desactivar' : 'Activar',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}