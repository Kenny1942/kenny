import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/src/data/auth_repository.dart';
import 'package:flutter_application_9/src/features/login/domain/user_profile.dart';
import 'package:provider/provider.dart';

class RegistrierungScreen extends StatefulWidget {
  const RegistrierungScreen({super.key});

  @override
  State<RegistrierungScreen> createState() => _RegistrierungScreenState();
}

class _RegistrierungScreenState extends State<RegistrierungScreen> {
  String userInput1 = "";
  String userInput2 = "";
  String userInput3 = "";

  Future<void> _onSubmit(BuildContext context, String email, String pw) async {
    final auth = Provider.of<AuthRepository>(context, listen: false);
    final user = await auth.createUserWithEmailAndPassword(email, pw);

    if (user != null) {
      final userProfile = UserProfile(
        id: user.uid,
        userId: user.uid,
        name: 'Neuer Benutzer', // temporal, puedes pedirlo en pantalla
        email: user.email,
        dateOfBirth: DateTime(2000, 1, 1), // puedes pedirlo también
        weight: 70.0,
        height: 170.0,
        gender: Gender.other,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(userProfile.toMap());

      print("✅ Perfil guardado con email: ${user.email}");
    }
  }

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
                  'Registriere Dich',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                SizedBox(
                  height: 50,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Anmelden mit deiner E-mail-adresse')),
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
                Align(alignment: Alignment.centerLeft, child: Text('Kennwort')),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  onChanged: (text) {
                    userInput2 = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Passwort',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  onChanged: (text) {
                    userInput3 = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Passwort bestätigen',
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
                ElevatedButton(
                  onPressed: () async {
                    // if (userInput3 == userInput2) {
                    //   Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //       builder: (context) =>
                    //           HauptScreen(widget.db, widget.auth),
                    //     ),
                    //   );
                    // } else {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       content:
                    //           Text("Emailadresse oder Passwort inkorrekt!"),
                    //       backgroundColor:
                    //           const Color.fromARGB(255, 83, 66, 63),
                    //     ),
                    //   );
                    // }
                    await _onSubmit(
                      context,
                      userInput1,
                      userInput2,
                    );
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
                    'Konto anlegen',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  child: Image.asset('assets/images/Facebook.png'),
                  onTap: () {},
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  child: Image.asset('assets/images/Google.png'),
                  onTap: () async {
                    final auth =
                        Provider.of<AuthRepository>(context, listen: false);
                    await auth.signInWithGoogle();
                  },
                ),
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
  if (value.length > 30) {
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
