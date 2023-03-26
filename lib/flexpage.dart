import 'package:flutter/material.dart';
import 'package:my_profile01/mylabel.dart';

class Flexpage extends StatelessWidget {
  const Flexpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expanded vs Flexible'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._buildHeader(context, 'Expanded'),
            _buildExpanded(),
            ..._buildHeader(context, 'Flexible'),
            _buildFlexible(),
            Expanded(child: Container()),
            const Center(
              child: Mylabel(
                text: 'Bottom',
                width: 100,
                height: 50,
                color: Colors.amber,
              ),
            )
          ],
        ),
      ),
    );
  }

  Iterable<Widget> _buildHeader(BuildContext context, String ttt) {
    return [
      SizedBox(
        height: 20,
      ),
      Text(
        ttt,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    ];
  }

  Widget _buildExpanded() {
    return SizedBox(
      height: 100,
      child: Row(
        children: const [
          Mylabel(
            text: "100",
            width: 100,
            color: Colors.green,
          ),
          Expanded(
            child: Mylabel(
              text: 'Expaned',
              color: Colors.lightBlue,
            ),
          ),
          Mylabel(
            text: "40",
            width: 40,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  _buildFlexible() {
    return SizedBox(
      height: 100,
      child: Row(
        children: const [
          Flexible(
            flex: 1,
            child: Mylabel(
              text: "1",
              color: Colors.green,
            ),
          ),
          Flexible(
            flex: 1,
            child: Mylabel(
              text: '1',
              color: Colors.lightBlue,
            ),
          ),
          Flexible(
            flex: 2,
            child: Mylabel(
              text: "2",
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
