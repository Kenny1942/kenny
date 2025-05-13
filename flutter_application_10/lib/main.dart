import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: ListaDinamica());
  }
}

class ListaDinamica extends StatefulWidget {
  const ListaDinamica({super.key});

  @override
  State<ListaDinamica> createState() => _ListaDinamicaState();
}

class _ListaDinamicaState extends State<ListaDinamica> {
  // Lista de elementos dinámicos
  final List<Map<String, String>> _items = [];

  // Función para agregar elementos a la lista
  void _agregarElemento() {
    String nombre = '';
    String urlImagen = '';

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Nuevo elemento'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Nombre'),
                onChanged: (value) => nombre = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'URL Imagen'),
                onChanged: (value) => urlImagen = value,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (nombre.isNotEmpty && urlImagen.isNotEmpty) {
                  setState(() {
                    _items.add({'nombre': nombre, 'imagen': urlImagen});
                  });
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Agregar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista Dinámica')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (_, index) {
          final item = _items[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item['imagen']!),
            ),
            title: Text(item['nombre']!),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _agregarElemento,
        child: const Icon(Icons.add),
      ),
    );
  }
}
