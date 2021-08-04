import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timerapp/Home.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({ Key? key, required this.time, required this.type}) : super(key: key);

  final time;
  final type;

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<TimerScreen> {
  var maxSeconds = 60;
  var seconds = 0;
  var started = false;
  Timer? timer;
  
  @override

  void startTimerSeconds(){
    timer = Timer.periodic((Duration(seconds: 1)), (_) { 
      if(seconds <= 0){
        stopTimer();
      }else{
        setState(() {
          --seconds;
        });
      }
    });
  }
    void startTimerMinutes(){
    timer = Timer.periodic((Duration(minutes: 1)), (_) { 
      if(seconds <= 0){
        stopTimer();
      }else{
        setState(() {
          --seconds;
        });
      }
    });
  }
    void startTimerHours(){
    timer = Timer.periodic((Duration(hours: 1)), (_) { 
      if(seconds <= 0){
        stopTimer();
      }else{
        setState(() {
          --seconds;
        });
      }
    });
  }
  void stopTimer(){
    timer?.cancel();
  }
  void reset(){
    setState(() {
      seconds = maxSeconds;
      started = false;
    });
    timer?.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    seconds = int.parse(widget.time);
    maxSeconds = int.parse(widget.time);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(title: Text("Timer")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        SizedBox(
          height: 200,
          width: 200,
          child: Stack(children: [
            SizedBox(
              height: 200,
              width: 200,
              child: CircularProgressIndicator(value: seconds/maxSeconds, strokeWidth: 14, backgroundColor: Colors.transparent, valueColor: AlwaysStoppedAnimation(Colors.blue),),
            ),
            Center(child: Text("${seconds}", style: TextStyle(fontSize: 80, color: Colors.blue, fontWeight: FontWeight.bold)),)
          ],),
        ),Container(alignment: Alignment.center),
        
        Container(
          margin: EdgeInsets.only(top: 50),
          child: !started ? 
            ElevatedButton(
              onPressed: (){
                setState(() {
                   started = true;
                });
                widget.type == Choices.minutes ? startTimerMinutes() : widget.type == Choices.hours ? startTimerHours() : startTimerSeconds();
            },
          child: Text("Start Timer", style: TextStyle(color: Colors.blue),),
          style: ElevatedButton.styleFrom(primary: Colors.white),
        ):Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: reset,
                child: Text("Reset", style: TextStyle(color: Colors.blue),),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              ),
              ElevatedButton(
                onPressed: stopTimer,
                child: Text("Pause", style: TextStyle(color: Colors.blue),),
                style: ElevatedButton.styleFrom(primary: Colors.white),
              ),
            ],
          ),
        ),
        
      ],),
    );
  }
}
