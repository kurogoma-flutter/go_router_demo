import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationTopB extends StatelessWidget {
  const BottomNavigationTopB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationTopA'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => context.push('/bottomB/pageA'),
              child: const Text('BottomB PageA'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/bottomB/pageB'),
              child: const Text('BottomB PageB'),
            ),
            ElevatedButton(
              onPressed: () => context.push('/bottomB/pageC'),
              child: const Text('BottomB PageC'),
            ),
          ],
        ),
      ),
    );
  }
}
