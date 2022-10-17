import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:ejercicio_shared_preferences/saved_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'Texto a guardar'),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                addStringToSP(textController.text);
                log(textController.text);
              },
              child: const Text('Guardar')),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavedTextScreen(),
                  ),
                );
              },
              child: const Text('Cargar')),
          ElevatedButton(
              onPressed: () {
                deleteValues();
              },
              child: const Text('Borrar texto')),
        ],
      ),
    );
  }

  Future<void> addStringToSP(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('stringValue', text);
  }

  deleteValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Remove String
    prefs.remove("stringValue");
  }
}
