import 'package:flutter/material.dart';

class AdButton extends StatefulWidget {
  const AdButton({super.key});

  @override
  State<AdButton> createState() => _AdButtonState();
}

class _AdButtonState extends State<AdButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Int Button'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Reverd Button'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
