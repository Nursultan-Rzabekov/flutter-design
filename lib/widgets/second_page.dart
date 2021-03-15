import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFE5E5E5)),
      home: Scaffold(
        appBar: AppBar(
          actions: [Icon(Icons.ac_unit_outlined)],
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 17, 0),
                  child: Row(
                    children: [
                      Image(image: AssetImage('assets/icons/icon.png')),
                    ],
                  ),
                ),
                Row(),
                Row(),
                Row()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
