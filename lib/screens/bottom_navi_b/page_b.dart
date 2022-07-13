import 'package:flutter/material.dart';

class BottomBPageB extends StatelessWidget {
  const BottomBPageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomB PageB'),
      ),
      body: const Center(child: Text('BottomB PageB')),
    );
  }
}
