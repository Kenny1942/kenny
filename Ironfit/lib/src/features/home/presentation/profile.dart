import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_9/src/data/database_repository.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_9/src/features/login/domain/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserProfile? _profile;

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  Gender? _selectedGender;

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final db = Provider.of<DatabaseRepository>(context, listen: false);
    final profile = await db.getUserProfile(uid);

    if (profile != null) {
      _profile = profile;
      _nameController.text = profile.name;
      _weightController.text = profile.weight.toString();
      _heightController.text = profile.height.toString();
      _selectedGender = profile.gender;
    } else {
      // wenn profil nicht existiert, leere werte werden geladen
      _profile = UserProfile(
        id: uid,
        userId: uid,
        name: '',
        email: '',
        dateOfBirth: DateTime.now(),
        weight: 0,
        height: 0,
        gender: Gender.other,
      );
    }

    setState(() {
      _loading = false;
    });
  }

  Future<void> _saveUserNameLocally(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_name', _nameController.text);
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    final uid = FirebaseAuth.instance.currentUser!.uid;
    final db = Provider.of<DatabaseRepository>(context, listen: false);

    final updatedProfile = UserProfile(
      id: _profile!.id,
      userId: uid,
      name: _nameController.text,
      dateOfBirth: _profile!.dateOfBirth,
      weight: double.tryParse(_weightController.text) ?? 0,
      height: double.tryParse(_heightController.text) ?? 0,
      gender: _selectedGender ?? Gender.other,
    );

    if (_profile != null) {
      await db.updateUserProfile(updatedProfile);
    } else {
      await db.createUserProfile(updatedProfile);
    }

    await _saveUserNameLocally(updatedProfile.name);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Profil aktualisiert')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: Text('User Profile Settings')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('User Profile Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _weightController,
                decoration: InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: TextInputType.number,
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _heightController,
                decoration: InputDecoration(labelText: 'Height (cm)'),
                keyboardType: TextInputType.number,
                validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              ),
              DropdownButtonFormField<Gender>(
                value: _selectedGender,
                decoration: InputDecoration(labelText: 'Gender'),
                items: Gender.values.map((g) {
                  return DropdownMenuItem(
                    value: g,
                    child: Text(g.name),
                  );
                }).toList(),
                onChanged: (g) => setState(() {
                  _selectedGender = g;
                }),
                validator: (v) => v == null ? 'Required' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
                child: Text('Save Changes'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
