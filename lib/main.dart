import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const XylophoneScreen(),
    );
  }
}

class XylophoneScreen extends StatelessWidget {
  const XylophoneScreen({super.key});
  
  void playSound(int noteNumber) async {
    final player = AudioPlayer();
    await player.setSource(AssetSource('note$noteNumber.wav'));
    player.resume();
  }

  Widget buildKey({required Color color, required int noteNumber, required String label}) {
    return GestureDetector(
      onTap: () => playSound(noteNumber),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(4, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xylophone App"),
        backgroundColor: Colors.black87,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildKey(color: Colors.red, noteNumber: 1, label: "Do"),
          buildKey(color: Colors.orange, noteNumber: 2, label: "Re"),
          buildKey(color: Colors.yellow, noteNumber: 3, label: "Mi"),
          buildKey(color: Colors.green, noteNumber: 4, label: "Fa"),
          buildKey(color: Colors.teal, noteNumber: 5, label: "Sol"),
          buildKey(color: Colors.blue, noteNumber: 6, label: "La"),
          buildKey(color: Colors.purple, noteNumber: 7, label: "Si"),
        ],
      ),
    );
  }
}