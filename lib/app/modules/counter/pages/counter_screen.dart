import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'C O U N T E R',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Consumer<CounterProvider>(
        builder: (context, counterProvider, _) {
          return _buildCounter(counterProvider, context);
        },
      ),
    );
  }

  Column _buildCounter(CounterProvider counterProvider, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Value:',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          counterProvider.counter.toString(),
          style: const TextStyle(fontSize: 40),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                counterProvider.increment();
              },
              child: const Icon(Icons.add, color: Colors.white),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                counterProvider.decrement();
              },
              child: const Icon(Icons.remove, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
