import 'package:flutter/material.dart';
import 'package:flutter_application_12/creating_user.dart';
import 'package:flutter_application_12/user.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<User> _user;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _user = CreatingUser().getRandomUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api-App'), backgroundColor: Colors.blue),
      body: FutureBuilder(
        future: _user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Column(
                children: [
                  SizedBox(height: 130),
                  Text(snapshot.data!.name, style: TextStyle(fontSize: 25)),
                  Text(snapshot.data!.country),
                  Text(
                    snapshot.data!.email,
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(snapshot.data!.picture),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  FilledButton(
                    onPressed: () async {
                      setState(() {
                        isLoading = true;
                      });
                      final userFuture = CreatingUser().getRandomUser();

                      setState(() {
                        _user = userFuture;
                      });

                      await userFuture; // Espera a que el future termine
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text('neuer Kandidat'),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: const CircularProgressIndicator());
        },
      ),
    );
  }
}
