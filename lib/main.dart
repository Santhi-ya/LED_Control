import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LedTogglePage(),
    );
  }
}

class LedTogglePage extends StatefulWidget {
  const LedTogglePage({super.key});

  @override
  State<LedTogglePage> createState() => _LedTogglePageState();
}

class _LedTogglePageState extends State<LedTogglePage>
    with SingleTickerProviderStateMixin {
  bool isOn = false;

  void toggleLED(bool value) {
    setState(() {
      isOn = value;
    });

    // 🔴 Hardware logic (unchanged)
    if (isOn) {
      print("LED ON");
    } else {
      print("LED OFF");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: isOn ? Colors.green.withOpacity(0.6) : Colors.red.withOpacity(0.6),
                  blurRadius: 25,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🔵 LED Circle
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isOn ? Colors.green : Colors.red,
                    boxShadow: [
                      BoxShadow(
                        color: isOn
                            ? Colors.greenAccent.withOpacity(0.8)
                            : Colors.redAccent.withOpacity(0.8),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Text(
                  isOn ? "LED is ON" : "LED is OFF",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: isOn ? Colors.greenAccent : Colors.redAccent,
                  ),
                ),

                const SizedBox(height: 25),

                Switch(
                  value: isOn,
                  onChanged: toggleLED,
                  activeThumbColor: Colors.greenAccent,
                  inactiveThumbColor: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}