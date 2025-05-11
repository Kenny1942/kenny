import 'package:flutter/material.dart';

class Dinamiclist extends StatefulWidget {
  final VoidCallback back;

  const Dinamiclist({super.key, required this.back});

  @override
  State<Dinamiclist> createState() => _ListaDinamicaState();
}

class _ListaDinamicaState extends State<Dinamiclist> {
  final List<Map<String, String>> _items = [];

  void _addingElement() {
    String nombre = '';
    String urlImagen = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Neue Freunde Hinzufügen'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: 'Name'),
                onChanged: (value) => nombre = value,
              ),
              TextField(
                decoration: const InputDecoration(labelText: 'URL'),
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
                }
                Navigator.pop(context);
              },
              child: const Text('Hinzufügen'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // arrow
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 8.0),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: widget.back,
            ),
          ),
        ),
        // list
        Padding(
          padding: const EdgeInsets.only(top: 165),
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              final item = _items[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item['imagen']!),
                ),
                title: Text(item['nombre']!),
              );
            },
          ),
        ),
        //button
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            onPressed: _addingElement,
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
