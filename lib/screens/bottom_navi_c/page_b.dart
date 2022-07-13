import 'package:flutter/material.dart';

class BottomCPageB extends StatelessWidget {
  const BottomCPageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomC PageB'),
      ),
      body: const Center(child: Text('BottomC PageB')),
    );
  }
}
