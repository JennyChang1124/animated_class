import 'package:flutter/material.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GFG(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GFG extends StatefulWidget {
  const GFG({Key? key}) : super(key: key);

  @override
  State<GFG> createState() => _GFGState();
}

class _GFGState extends State<GFG> with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _bool = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation  Sample"),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(
                    () {
                  _bool = !_bool;
                },
              );
            },
            child: Text("切換"),
          ),
        ],
      ),
      body: Center(
        child: AnimatedCrossFade(
          // First widget
            firstChild: Container(
              child:Icon(Icons.circle_notifications_outlined,size: 60,),
            ),
            secondChild: Container(
                child:Icon(Icons.ice_skating,size: 60,)
            ),
            crossFadeState:
            _bool ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            // Duration for crossFade animation.
            duration: Duration(seconds: 1)),
      ),
    );
  }
}
