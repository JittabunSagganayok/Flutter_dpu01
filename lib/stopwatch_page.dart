import 'dart:async';
//import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_profile01/platform_alert.dart';

class Stopwatch extends StatefulWidget {
  //static const String route = '/stopwatch';
  String title;

  Stopwatch({super.key, required this.title});
  //const Stopwatch({super.key});

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  int _millisec = 0;
  Timer? _timer;
  bool _isTick = false;
  final _labs = <int>[];
  final _itemHeight = 40.0;
  final _scrollControl = ScrollController();
  //var newwidgettitle = "";

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   //_timer = Timer.periodic(Duration(seconds: 1), _onTick);
  //   super.initState();
  //   setState(() {
  //     newwidgettitle = widget.title;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), actions: <Widget>[
        IconButton(
          onPressed: () {
            // final totalRuntime = _labs.fold(_millisec, (total, lab) => total + lab);
            // final alert =
            //     PlatformAlert(title: 'Log out', message: 'Are you sure ?');
            // alert.show(context);

            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Log out"),
                  content: Text("Are you sue ?"),
                  actions: [
                    TextButton(
                      child: Text("Yes"),
                      onPressed: () => {
                        Modular.to
                            .pushReplacementNamed('/', arguments: widget.title)
                      },
                    ),
                    TextButton(
                        child: Text("No"),
                        onPressed: () => Navigator.of(context).pop()),
                  ],
                );
              },
            );

            // setState(() {
            //   Modular.to.pushReplacementNamed('/', arguments: widget.title);
            // });
          },
          icon: Icon(Icons.logout_rounded),
        ),
      ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Lab ${_labs.length + 1}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Center(
                    child: Text(
                      _sectext(_millisec),
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildActionButtons(),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: //_ListLabs(),
                Scrollbar(
              controller: _scrollControl,
              child: ListView.builder(
                controller: _scrollControl,
                itemExtent: _itemHeight,
                itemCount: _labs.length,
                itemBuilder: (context, index) {
                  // final millisecrecord = _labs[index];
                  return ListTile(
                    title: Text('Lab ${index + 1}'),
                    trailing: Text(
                      _sectext(_labs[index]),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _ListLabs() => ListView(
        children: [
          for (var items in _labs)
            ListTile(
              title: Text(_sectext(items)),
            )
        ],
      );

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _isTick ? null : _startTimer,
          child: Text("Start"),
        ),
        SizedBox(
          width: 20,
        ),
        ElevatedButton(
          onPressed: _isTick ? _lab : null,
          child: Text("Lab"),
        ),
        SizedBox(
          width: 20,
        ),
        Builder(
          builder: (context) => ElevatedButton(
            onPressed: _isTick ? () => _stopTimer(context) : null,
            child: Text("Stop"),
          ),
        ),
      ],
    );
  }
//   void updateUI(String newtitle) {
//   setState(() {
//     // update your state variables here
//     widget.title = newData;
//   });
// }

  void _onTick(Timer timer) {
    setState(() {
      _millisec += 100;
    });
  }

  String _sectext(int millisec) {
    return '${millisec / 1000} ${millisec <= 1 ? "second" : "seconds"}';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 100), _onTick);
    setState(() {
      _labs.clear();
      _millisec = 0;
      _isTick = true;
    });
  }

  void _stopTimer(BuildContext context) {
    _timer?.cancel();
    setState(() {
      //_sec = 0;
      _isTick = false;
    });
    // final totalRuntime = _labs.fold(_millisec, (total, lab) => total + lab);
    // final alert = PlatformAlert(
    //     title: 'Run complete',
    //     message: 'Total Runtime is ${_sectext(totalRuntime)}');
    // alert.show(context);
    final controller = showBottomSheet(
      context: context,
      builder: _buildRunCompleteSheet,
    );
    Future.delayed(Duration(seconds: 5)).then((value) => controller.close());
    //navigator.pop
  }

  void _lab() {
    setState(() {
      _labs.add(_millisec);
      _millisec = 0;
    });
    _scrollControl.jumpTo(_itemHeight * _labs.length);
  }

  Widget _buildRunCompleteSheet(BuildContext context) {
    final totalRuntime = _labs.fold(_millisec, (total, lab) => total + lab);
    return SafeArea(
      child: Container(
        color: Theme.of(context).cardColor,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Text(
                'Run Completed !',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text('Total runtime is ${_sectext(totalRuntime)}'),
              Expanded(child: SizedBox()),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  "Close",
                  style: TextStyle(color: Colors.amber),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
