import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdditionalPage extends StatelessWidget {
  const AdditionalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Additional Page'),
      ),
      body: const Center(
        child: Text('Additional Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/bottomC'),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
