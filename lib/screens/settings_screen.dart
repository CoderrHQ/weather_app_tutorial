import 'package:flutter/material.dart';

import '/views/gradient_container.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height - 150,
          width: double.infinity,
          child: const Center(
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
