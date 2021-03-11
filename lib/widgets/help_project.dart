import 'package:flutter/material.dart';

class HelpProjectWidget extends StatefulWidget {
  @override
  _HelpProjectState createState() => _HelpProjectState();
}

class _HelpProjectState extends State<HelpProjectWidget> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Ink(
        child: Card(
          shape: selected
              ? RoundedRectangleBorder(
                  side: new BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                )
              : RoundedRectangleBorder(
                  side: new BorderSide(color: Colors.green, width: 2.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
          child: Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/help_project.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 12),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Поддержать\nпроект",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 31,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
