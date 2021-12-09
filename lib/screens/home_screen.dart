import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int count = 0;

  void increase() {
    count++;
    setState(() {});
  }

  void decrease() {
    count--;
    setState(() {});
  }

  void reset() {
    count = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
        elevation: 20,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Número de clicks',
              style: textStyle,
            ),
            Text(
              '$count',
              style: textStyle,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FlotingButtonActions(
        increaseFn: increase,
        decreaseFn: decrease,
        resetFn: reset,
      ),
    );
  }
}

class FlotingButtonActions extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const FlotingButtonActions({
    Key? key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.exposure_plus_1),
          onPressed: () => increaseFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.replay_circle_filled_sharp),
          onPressed: () => resetFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.exposure_minus_1_outlined),
          onPressed: () => decreaseFn(),
        ),
      ],
    );
  }
}
