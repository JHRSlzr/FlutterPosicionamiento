import 'package:flutter/material.dart';

class ControlesPage extends StatefulWidget {
  @override
  createState() {
    return _controlesState();
  }
}

class _controlesState extends State<ControlesPage> {
  final limSup = 10;
  final limInf = -10;
  int position = 0;
  int orientation = 0;

  String orientationStatus = 'ORIENTACIÓN: Norte';
  String positionStatus = 'ESTADO: -------';

  void getStart() => {
        setState(() {
          position = 0;
          orientation = 0;
          orientationStatus = 'ORIENTACIÓN: Norte';
          positionStatus = 'ESTADO: -------';
        })
      };

  void upAction() => {
        setState(() {
          position++;

          if (position >= limSup) {
            position = 10;
            positionStatus = 'ESTADO: LIMITE SUPERIOR';
          }
          else{
            positionStatus = 'ESTADO: -------';
          }
        })
      };

  void downAction() => {
        setState(() {
          position--;

          if (position <= limInf) {
            position = -10;
            positionStatus = 'ESTADO: LIMITE INFERIOR';
          }
          else{
            positionStatus = 'ESTADO: -------';
          }
        })
      };

  void turnRight() => {
        setState(() {
          orientation++;

          if (orientation > 3) orientation = 0;

          switch (orientation) {
            case 0:
              {
                orientationStatus = 'ORIENTACIÓN: Norte';
                break;
              }
            case 1:
              {
                orientationStatus = 'ORIENTACIÓN: Este';
                break;
              }
            case 2:
              {
                orientationStatus = 'ORIENTACIÓN: Sur';
                break;
              }
            case 3:
              {
                orientationStatus = 'ORIENTACIÓN: Oeste';
                break;
              }
          }
        })
      };

  void turnLeft() => {
        setState(() {
          orientation--;
          if (orientation < 0) orientation = 3;

          switch (orientation) {
            case 0:
              {
                orientationStatus = 'ORIENTACIÓN: Norte';
                break;
              }
            case 1:
              {
                orientationStatus = 'ORIENTACIÓN: Este';
                break;
              }
            case 2:
              {
                orientationStatus = 'ORIENTACIÓN: Sur';
                break;
              }
            case 3:
              {
                orientationStatus = 'ORIENTACIÓN: Oeste';
                break;
              }
          }
        })
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONTROLES GAMER'),
        centerTitle: true,
      ),
      body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 3,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
            ),
            FlatButton(
                child: Icon(Icons.arrow_circle_up_sharp), onPressed: upAction),
            Container(
              padding: const EdgeInsets.all(10),
            ),
            FlatButton(
                child: Icon(Icons.arrow_back_ios), onPressed: turnLeft),
            FlatButton(
                child: Icon(Icons.accessibility_rounded), onPressed: getStart),
            FlatButton(
                child: Icon(Icons.arrow_forward_ios), onPressed: turnRight),
            Text('$orientationStatus', textAlign: TextAlign.center),
            FlatButton(
                child: Icon(Icons.arrow_circle_down_sharp),onPressed: downAction),
            Text('$positionStatus', textAlign: TextAlign.center)
            
          ]),
    );
  }
}
