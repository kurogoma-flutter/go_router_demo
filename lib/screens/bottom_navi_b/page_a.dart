import 'package:flutter/material.dart';

class BottomBPageA extends StatelessWidget {
  const BottomBPageA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomB PageA'),
      ),
      body: const Center(child: Text('BottomB PageA')),
    );
  }
}
