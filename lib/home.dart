import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double count = 0;
  double countStep = 1;
  TextEditingController _controller = TextEditingController();
  void click() {
    setState(() {
      count += countStep;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              "Here We Are Counting How many times you clicked that PLUS marked stupid BUTTON",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Center(
            child: Text(
              count.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 150.0,
                width: 150.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        count = 0;
                        countStep = 1;
                      });
                    },
                    backgroundColor: Colors.deepPurple,
                    child: Text(
                      'RESET',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                height: 150.0,
                width: 150.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    onPressed: click,
                    backgroundColor: Colors.deepPurple,
                    child: Text(
                      '+',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 130,
                child: TextField(
                  cursorColor: Colors.deepPurple[1000],
                  controller: _controller,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: Colors.yellow,
                  ),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Step",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white.withOpacity(0.5),
                      )),
                ),
              ),
              Container(
                  width: 100,
                  height: 100,
                  child: FittedBox(
                    child: FloatingActionButton(
                      child: Text(
                        'Change Step',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10),
                      ),
                      onPressed: () {
                        setState(() {
                          if (_controller.text.isEmpty) {
                            countStep = 1;
                          } else {
                            countStep =
                                double.parse(_controller.text).toDouble();
                            _controller.clear();
                          }
                        });
                      },
                      backgroundColor: Colors.deepPurple[800],
                    ),
                  )),
            ],
          ),
        ],
      ),
      backgroundColor: Colors.deepPurple[400],
      appBar: AppBar(
        title: Text('COUNTING APP'),
        backgroundColor: Colors.deepPurple[700],
        centerTitle: true,
      ),
    );
  }
}
