import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SavedTextScreen extends StatefulWidget {
  @override
  _SavedTextScreenState createState() => _SavedTextScreenState();
}

class _SavedTextScreenState extends State<SavedTextScreen> {
  String? stringValue;

  Future<void> func() async {
    Future<String?> svsp = getStringValuesSP();
    String? values = await svsp;
    setState(() => stringValue = values);
  }

  @override
  void initState() {
    super.initState();
    func();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de textos'),
      ),
      body: Center(child: Text(stringValue!)),
    );
  }

  getStringValuesSP() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    stringValue = prefs.getString('stringValue');
    return stringValue;
  }
}
