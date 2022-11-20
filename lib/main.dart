import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Animation  Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double padValue = 500.0;
  double padValue2 =500.0;
  void _updatePadding(double value) {
    setState(() {
      padValue = value;
      padValue2 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        AnimatedPadding(
            padding: EdgeInsets.only(left:150,top: padValue2),
            duration: const Duration(seconds: 3),
            curve: Curves.easeOut,
            child: const Icon(
              Icons.airplanemode_active,
              color: Colors.blue,
              size: 50,
            ),
            onEnd: (){
              setState(() {
                padValue2 = 400;
              });
            }
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left:150,top: 10),
          child:  ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Colors.blue),),
                    onPressed: () {
                _updatePadding(padValue2== 0.0 ? 100.0 : 0.0);
                },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.airplanemode_active_outlined),
                  Text('起飛'),
                ],
              ),
          ),
        ),
      ],
    ),
    );
  }
}