// lib/screens/submenu3_screen.dart
// Esta es la pantalla para el Submenú 3

import 'package:flutter/material.dart';

// Submenu3Screen es un StatefulWidget que muestra el contenido del Submenú 3
class Submenu3Screen extends StatefulWidget {
  const Submenu3Screen({Key? key}) : super(key: key);

  @override
  State<Submenu3Screen> createState() => _Submenu3ScreenState();
}

class _Submenu3ScreenState extends State<Submenu3Screen> {
  // Variables para almacenar los valores de los controles
  double _sliderValue = 50;
  bool _switchValue1 = false;
  bool _switchValue2 = true;
  String _selectedRadio = 'opcion1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submenú 3'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Configuraciones:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            
            // Sección de Slider (control deslizante)
            const Text(
              'Ajuste de valor:',
              style: TextStyle(fontSize: 16),
            ),
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: _sliderValue.round().toString(),
              // Cuando el valor cambia, actualizamos el estado
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            Center(
              child: Text(
                'Valor: ${_sliderValue.round()}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(), // Línea divisoria
            const SizedBox(height: 20),
            
            // Sección de Switches (interruptores)
            const Text(
              'Opciones de activación:',
              style: TextStyle(fontSize: 16),
            ),
            SwitchListTile(
              title: const Text('Notificaciones'),
              subtitle: const Text('Activar o desactivar notificaciones'),
              value: _switchValue1,
              // Cuando el valor cambia, actualizamos el estado
              onChanged: (bool value) {
                setState(() {
                  _switchValue1 = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Modo oscuro'),
              subtitle: const Text('Cambiar apariencia de la aplicación'),
              value: _switchValue2,
              // Cuando el valor cambia, actualizamos el estado
              onChanged: (bool value) {
                setState(() {
                  _switchValue2 = value;
                });
              },
            ),
            
            const SizedBox(height: 20),
            const Divider(), // Línea divisoria
            const SizedBox(height: 20),
            
            // Sección de Radio Buttons (botones de opción)
            const Text(
              'Selecciona una opción:',
              style: TextStyle(fontSize: 16),
            ),
            // Usamos un Column para organizar los RadioListTile verticalmente
            Column(
              children: <Widget>[
                RadioListTile<String>(
                  title: const Text('Opción 1'),
                  value: 'opcion1',
                  groupValue: _selectedRadio,
                  // Cuando el valor cambia, actualizamos el estado
                  onChanged: (String? value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Opción 2'),
                  value: 'opcion2',
                  groupValue: _selectedRadio,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Opción 3'),
                  value: 'opcion3',
                  groupValue: _selectedRadio,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedRadio = value!;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}