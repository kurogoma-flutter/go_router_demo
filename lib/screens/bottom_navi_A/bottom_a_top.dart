import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationTopA extends StatelessWidget {
  const BottomNavigationTopA({Key? key}) : super(key: key);

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
                onPressed: () => context.push('/bottomA/pageA'),
                child: const Text('BottomA PageA'),
              ),
              ElevatedButton(
                onPressed: () => context.push('/bottomA/pageB'),
                child: const Text('BottomA PageB'),
              ),
              ElevatedButton(
                onPressed: () => context.push('/bottomA/pageC'),
                child: const Text('BottomA PageC'),
              ),
            ],
          )),
    );
  }
}
