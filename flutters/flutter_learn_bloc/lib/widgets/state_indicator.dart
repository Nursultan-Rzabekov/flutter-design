import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class StateAppIndicator extends State<MyApp> {
  bool _loading;
  double _pValue;

  @override
  void initState() {
    _loading = false;
    _pValue = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("App Bar title"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
            child: _loading
                ? Column(
                    children: <Widget>[
                      LinearProgressIndicator(
                        value: _pValue,
                      ),
                      Text("loading ${(_pValue)}%")
                    ],
                  )
                : Text("Loading completed")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _loading = !_loading;
            _updateProgress();
          });
        },
        child: Icon(Icons.access_time),
      ),
    ));
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _pValue += 0.1;
        if (_pValue >= 1.0) {
          _loading = false;
          _pValue = 0.0;
          return;
        }
      });
    });
  }
}
