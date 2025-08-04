import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/features/freunde/domain/freunde.dart';

class Dinamiclist extends StatefulWidget {
  final VoidCallback back;
  final String title;

  const Dinamiclist({super.key, required this.back, required this.title});

  @override
  State<Dinamiclist> createState() => _ListaDinamicaState();
}

class _ListaDinamicaState extends State<Dinamiclist> {
  final List<Map<String, String>> _items = [];

  Future<void> _addingElement() async {
    String email = '';

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Freund per E-Mail hinzufügen'),
          content: TextField(
            decoration: const InputDecoration(labelText: 'Email des Freundes'),
            onChanged: (value) => email = value.trim(),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                if (email.isEmpty) return;

                final currentUser = FirebaseAuth.instance.currentUser;
                if (currentUser == null) return;

                final querySnapshot = await FirebaseFirestore.instance
                    .collection('users')
                    .where('email', isEqualTo: email)
                    .get();

                if (querySnapshot.docs.isNotEmpty) {
                  final friendDoc = querySnapshot.docs.first;
                  final friendId = friendDoc.id;

                  if (friendId == currentUser.uid) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Du kannst dich nicht selbst hinzufügen')),
                    );
                    return;
                  }

                  // Verifica si ya existe la amistad
                  final existing = await FirebaseFirestore.instance
                      .collection('friends')
                      .where('userId', isEqualTo: currentUser.uid)
                      .where('friendId', isEqualTo: friendId)
                      .get();

                  if (existing.docs.isEmpty) {
                    final newDoc =
                        FirebaseFirestore.instance.collection('friends').doc();

                    final newFriend = Friend(
                      id: newDoc.id,
                      userId: currentUser.uid,
                      friendId: friendId,
                      dateAdded: DateTime.now(),
                    );

                    await newDoc.set(newFriend.toMap());

                    setState(() {
                      _items.add({
                        'name': friendDoc['name'] ?? 'Unbekannt',
                        'image':
                            'https://via.placeholder.com/150', // o carga la imagen real si la tienes
                      });
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Freund hinzugefügt')),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Dieser Freund wurde bereits hinzugefügt')),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                            Text('Kein Benutzer mit dieser E-Mail gefunden')),
                  );
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

  Future<void> _loadFriends() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) return;

    final friendsSnapshot = await FirebaseFirestore.instance
        .collection('friends')
        .where('userId', isEqualTo: currentUser.uid)
        .get();

    final List<Map<String, String>> loadedItems = [];

    for (final doc in friendsSnapshot.docs) {
      final friendId = doc['friendId'];

      // Busca el perfil del amigo
      final friendDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(friendId)
          .get();

      if (friendDoc.exists) {
        final data = friendDoc.data()!;
        loadedItems.add({
          'name': data['name'] ?? 'Unbekannt',
          'image':
              'https://via.placeholder.com/150', // o carga una real si tienes
        });
      }
    }

    setState(() {
      _items.clear();
      _items.addAll(loadedItems);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFriends();
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
        Positioned(
            top: 150,
            left: 150,
            child: Text(widget.title, style: const TextStyle(fontSize: 24))),
        Padding(
          padding: const EdgeInsets.only(top: 165),
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              final item = _items[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item['image']!),
                ),
                title: Text(item['name']!),
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
