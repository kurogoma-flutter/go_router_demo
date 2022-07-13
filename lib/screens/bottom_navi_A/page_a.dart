import 'package:flutter/material.dart';

class BottomAPageA extends StatelessWidget {
  const BottomAPageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomA PageA'),
      ),
      body: const Center(child: Text('BottomA PageA')),
    );
  }
}
