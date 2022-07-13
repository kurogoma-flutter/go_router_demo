import 'package:flutter/material.dart';

class BottomCPageA extends StatelessWidget {
  const BottomCPageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomC PageA'),
      ),
      body: const Center(child: Text('BottomC PageA')),
    );
  }
}
