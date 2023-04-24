import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ExitButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.grey[500],
      child: const Text("Exit"),
    );
  }
}
