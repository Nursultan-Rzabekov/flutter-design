import 'package:flutter/material.dart';
import 'package:flutter_design/utils/Constants.dart';

class NamazTime extends StatefulWidget {
  @override
  createState() => _NamazTimeState();
}

class _NamazTimeState extends State<NamazTime> {
  String name;
  String description;
  String url;
  int count = 0;

  @override
  void initState() {
    super.initState();
    name = "Бамдат";
    description = "Таң намазы";
    url = 'assets/images/fadjr.png';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        count++;

        setState(() {
          switch (count % 5) {
            case 0:
              url = Constants.FADJR_IMAGE;
              name = Constants.FADJR;
              description = Constants.FADJR_DESC;
              break;
            case 1:
              url = Constants.ZUHR_IMAGE;
              name = Constants.ZUHR;
              description = Constants.ZUHR_DESC;
              break;
            case 2:
              url = Constants.ASR_IMAGE;
              name = Constants.ASR;
              description = Constants.ASR_DESC;
              break;
            case 3:
              url = Constants.MAGRIB_IMAGE;
              name = Constants.MAGRIB;
              description = Constants.MAGRIB_DESC;
              break;
            case 4:
              url = Constants.ISHA_IMAGE;
              name = Constants.ISHA;
              description = Constants.ISHA_DESC;
              break;
          }
        });
      },
      child: Ink(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('${url}'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${name}",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              Text("${description}",
                  style: TextStyle(fontSize: 22, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
