import 'package:flutter/material.dart';

class DoorListPage extends StatelessWidget {
  const DoorListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doors'),
      ),
      body: const SafeArea(
        child: Center(
          child: Column(
            children: [
              Text('Door 1'),
              Text('Door 2'),
              Text('Door 3'),
            ],
          ),
        ),
      ),
    );
  }
}
