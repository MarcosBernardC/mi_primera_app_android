// lib/main.dart
// Este es el punto de entrada de nuestra aplicación Flutter

import 'package:flutter/material.dart';
// Importamos las pantallas de submenús que crearemos
import 'screens/submenu1_screen.dart';
import 'screens/submenu2_screen.dart';
import 'screens/submenu3_screen.dart';

// La función main es donde comienza la ejecución de la aplicación
void main() {
  // runApp inicia nuestra aplicación con el widget raíz MyApp
  runApp(const MyApp());
}

// MyApp es un StatelessWidget que define el tema y la pantalla inicial
// StatelessWidget: Un widget que no cambia su estado interno durante su vida útil
class MyApp extends StatelessWidget {
  // Constructor con parámetro key opcional
  const MyApp({Key? key}) : super(key: key);

  // El método build define cómo se ve y se comporta el widget
  @override
  Widget build(BuildContext context) {
    // MaterialApp es el widget raíz que proporciona muchas funciones de Material Design
    return MaterialApp(
      // Título de la aplicación
      title: 'Mi Primera App',
      // Tema de la aplicación
      theme: ThemeData(
        // Definimos el esquema de colores primario
        primarySwatch: Colors.blue,
        // Habilitamos el nuevo tema Material 3
        useMaterial3: true,
      ),
      // Eliminamos el banner de debug
      debugShowCheckedModeBanner: false,
      // La pantalla inicial de la aplicación
      home: const MenuPrincipal(),
    );
  }
}

// MenuPrincipal es un StatefulWidget que muestra el menú principal con botones
// StatefulWidget: Un widget que puede cambiar su estado interno durante su vida útil
class MenuPrincipal extends StatefulWidget {
  const MenuPrincipal({Key? key}) : super(key: key);

  // createState crea una instancia de _MenuPrincipalState
  @override
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

// _MenuPrincipalState es la clase que mantiene el estado para MenuPrincipal
class _MenuPrincipalState extends State<MenuPrincipal> {
  @override
  Widget build(BuildContext context) {
    // Scaffold proporciona la estructura básica de la pantalla
    return Scaffold(
      // AppBar es la barra superior de la aplicación
      appBar: AppBar(
        title: const Text('Menú Principal'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      // El cuerpo principal de la pantalla
      body: Center(
        // Usamos Column para organizar widgets verticalmente
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Bienvenido a Mi Primera App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40), // Espacio vertical
            // Widget personalizado para crear botones de menú
            _buildMenuButton(
              context, 
              'Submenú 1', 
              Colors.blue, 
              Icons.image, 
              const Submenu1Screen()
            ),
            const SizedBox(height: 20), // Espacio vertical
            _buildMenuButton(
              context, 
              'Submenú 2', 
              Colors.green, 
              Icons.music_note, 
              const Submenu2Screen()
            ),
            const SizedBox(height: 20), // Espacio vertical
            _buildMenuButton(
              context, 
              'Submenú 3', 
              Colors.orange, 
              Icons.settings, 
              const Submenu3Screen()
            ),
          ],
        ),
      ),
    );
  }
  
  // Método que construye un botón de menú personalizado
  // Este es un método privado (indicado por _) que solo se usa dentro de esta clase
  Widget _buildMenuButton(
    BuildContext context, 
    String text, 
    Color color, 
    IconData icon,
    Widget destination,
  ) {
    // ElevatedButton crea un botón con elevación
    return ElevatedButton(
      // Al presionar el botón, navegamos a la pantalla de destino
      onPressed: () {
        // Navigator.push añade una nueva pantalla a la pila de navegación
        Navigator.push(
          context,
          // MaterialPageRoute define la animación de transición de página
          MaterialPageRoute(builder: (context) => destination),
        );
      },
      // Estilo del botón
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      // Contenido del botón
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(width: 10), // Espacio horizontal
          Text(
            text,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}