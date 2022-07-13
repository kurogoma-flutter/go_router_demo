import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationTopC extends StatelessWidget {
  const BottomNavigationTopC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationTopC'),
      ),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => context.push('/bottomC/pageA'),
                child: const Text('BottomC PageA'),
              ),
              ElevatedButton(
                onPressed: () => context.push('/bottomC/pageB'),
                child: const Text('BottomC PageB'),
              ),
              ElevatedButton(
                onPressed: () => context.push('/bottomC/pageC'),
                child: const Text('BottomC PageC'),
              ),
            ],
          )),
    );
  }
}
