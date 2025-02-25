// lib/screens/submenu2_screen.dart
// Esta es la pantalla para el Submenú 2

import 'package:flutter/material.dart';

// Submenu2Screen es un StatefulWidget que muestra el contenido del Submenú 2
class Submenu2Screen extends StatefulWidget {
  const Submenu2Screen({Key? key}) : super(key: key);

  @override
  State<Submenu2Screen> createState() => _Submenu2ScreenState();
}

class _Submenu2ScreenState extends State<Submenu2Screen> {
  // Lista de elementos para mostrar
  final List<String> _elementos = [
    'Elemento 1',
    'Elemento 2',
    'Elemento 3',
    'Elemento 4',
    'Elemento 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submenú 2'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Lista de Elementos:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Expanded permite que el ListView ocupe todo el espacio disponible
            Expanded(
              // ListView.builder crea elementos de lista de manera eficiente,
              // solo cuando son visibles en pantalla
              child: ListView.builder(
                // itemCount define cuántos elementos tendrá la lista
                itemCount: _elementos.length,
                // itemBuilder construye cada elemento de la lista
                itemBuilder: (context, index) {
                  // Card crea una tarjeta con efecto de elevación
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      // Círculo a la izquierda con el número del elemento
                      leading: CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      // Título del elemento
                      title: Text(_elementos[index]),
                      // Subtítulo del elemento
                      subtitle: Text('Descripción del ${_elementos[index]}'),
                      // Ícono a la derecha
                      trailing: const Icon(Icons.arrow_forward_ios),
                      // Acción al tocar el elemento
                      onTap: () {
                        // Mostramos un SnackBar (mensaje emergente)
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Seleccionaste: ${_elementos[index]}'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}