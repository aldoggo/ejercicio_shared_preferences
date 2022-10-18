import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedTextScreen extends StatefulWidget {
  const SavedTextScreen({super.key});

  @override
  State<SavedTextScreen> createState() => _SavedTextScreenState();
}

class _SavedTextScreenState extends State<SavedTextScreen> {
  String? stringValue = "";

  @override
  void initState() {
    super.initState();
    func();
  }

  Future<void> func() async {
    Future<String?> svsp = getStringValuesSP();
    String? values = await svsp;
    setState(() => stringValue = values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de textos'),
      ),
      body: Center(child: Text($stringValue)),
    );
  }

  Future<String?> getStringValuesSP() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    stringValue = prefs.getString('stringValue');
    return stringValue;
  }
}
