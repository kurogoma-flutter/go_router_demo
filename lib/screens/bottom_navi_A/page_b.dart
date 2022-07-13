import 'package:flutter/material.dart';

class BottomAPageB extends StatelessWidget {
  const BottomAPageB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomA PageB'),
      ),
      body: const Center(child: Text('BottomA PageB')),
    );
  }
}
