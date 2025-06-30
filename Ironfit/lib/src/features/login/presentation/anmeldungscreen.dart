import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:flutter_application_9/src/features/home/presentation/mainscreen.dart';

class AnmeldungScreen extends StatefulWidget {
  final DatabaseRepository db;
  const AnmeldungScreen(this.db, {super.key});

  @override
  State<AnmeldungScreen> createState() => _AnmeldungScreenState();
}

class _AnmeldungScreenState extends State<AnmeldungScreen> {
  String userInput1 = "";
  String userInput2 = "";

  int y = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //geteilte hintergrund
          Positioned.fill(
            child: Image.asset('assets/images/backg.png', fit: BoxFit.fill),
          ),
          Container(
            color: const Color.fromARGB(255, 211, 200, 200),
          ),
          Positioned(
            left: 0,
            top: -320,
            child: Image.asset('assets/images/logo5.png'),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                SizedBox(
                  height: 170,
                ),
                Text(
                  'ANMELDEN',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                SizedBox(
                  height: 50,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('E-MAIL-ADRESSE')),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  onChanged: (text) {
                    userInput1 = text;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: validateEmailadresse,
                  decoration: InputDecoration(
                    hintText: 'Gib deine E-Mail-Adresse ein',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Align(alignment: Alignment.centerLeft, child: Text('KENNWORT')),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  onChanged: (text) {
                    userInput2 = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Gib dein Passwort ein',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                ),
                SizedBox(height: 50),
                Text('Hast du dein Kennwort vergessen?'),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (userInput1 == 'www' && userInput2 == 'hola') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HauptScreen(widget.db),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content:
                              Text("Emailadresse oder Passwort inkorrekt!"),
                          backgroundColor:
                              const Color.fromARGB(255, 83, 66, 63),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 194, 79, 79),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 120,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Jetzt Anmelden',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset('assets/images/Facebook.png'),
                SizedBox(
                  height: 10,
                ),
                Image.asset('assets/images/Google.png'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String? validateEmailadresse(value) {
  if (value == null || value.length < 3) {
    return 'Mindestens 3 Buchstaben';
  }
  if (value.length > 10) {
    return 'Maximal 10 Buchstaben';
  }
  if (value.contains(" ")) {
    return "Keine Leerzeichen erlaubt";
  }
  String x = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYT0123456789';
  if (!x.contains(value[0])) {
    return ('Sonderzeichen am Anfang nicht erlaubt');
  }

  return null;
}
