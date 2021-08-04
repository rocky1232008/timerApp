import 'package:flutter/material.dart';
import 'package:timerapp/timerScreen.dart';

enum Choices {
  seconds,
  minutes,
  hours,
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Choices? _choices = Choices.seconds;
  var value; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(title: Text('EPIC TIMER'),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(margin: EdgeInsets.only(top: 350),child: Text("EPIC TIMER",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),),
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 200,
                child: TextField(decoration: InputDecoration(hintText: 'Time', hoverColor: Colors.white),textAlign: TextAlign.center, onChanged: (time){
                  value = time;
                },)
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                
                children: [
                  ListTile(
                    title: Text('seconds'
                  , style: TextStyle(color: Colors.white),),
                    
                    leading: Radio<Choices>(
                      groupValue: _choices,
                      value: Choices.seconds,
                      onChanged: (value){
                        setState(() {
                          _choices = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('minutes'
                  , style: TextStyle(color: Colors.white),),
                    
                    leading: Radio<Choices>(
                      groupValue: _choices,
                      value: Choices.minutes,
                      onChanged: (value){
                        setState(() {
                          _choices = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('hours'
                  , style: TextStyle(color: Colors.white),),
                    
                    leading: Radio<Choices>(
                      groupValue: _choices,
                      value: Choices.hours,
                      onChanged: (value){
                        setState(() {
                          _choices = value;
                        });
                      },
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TimerScreen(time: value, type: _choices,)));
                  },
            child: Text("Start", style: TextStyle(color: Colors.blue),),
            style: ElevatedButton.styleFrom(primary: Colors.white),
          ),
              )],
          ),
        ),
      ),
    );
  }
}