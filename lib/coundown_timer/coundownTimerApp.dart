import 'dart:async';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class CoundownTimerApp extends StatefulWidget {
  @override
  _CoundownTimerAppState createState() => _CoundownTimerAppState();
}

class _CoundownTimerAppState extends State<CoundownTimerApp> {
  Timer timer;
  var minute = 0;
  var second = 0;
  int totalTime;
  void startTimer(){
    final oneSecond = Duration(seconds: 1);
    timer = Timer.periodic(oneSecond, (timer) {
        totalTime = minute*60 + second;
      setState(() {
        if(totalTime<1)
          timer.cancel();
        else {
          totalTime -= 1;
          if(second == 0){
            minute-=1;
            second=59;
          }
          else
            second-=1;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      child: Scaffold(
        appBar: VxAppBar(
          title: "CountDown Timer".text.size(24).makeCentered(),
          searchBar: true,
        ),
        body: Center(
          child: Text(
              "$minute:$second",
               style: Theme.of(context).textTheme.headline1,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
              showDialog(
                context: context,
                child: SimpleDialog(
                  contentPadding: EdgeInsets.all(15),
                    children:[
                      Text("Set Your Time"),
                      DropdownButton<int>(
                          value: minute,
                          icon: Text("Minute"),
                          items:List.generate(100, (index) {
                            return DropdownMenuItem(
                              value: index,
                              child: Text(index.toString()),
                            );
                          } ),
                          onChanged: (value){
                            setState(() {
                              minute = value;
                            });
                          }),
                      DropdownButton<int>(
                        value: second,
                          icon: Text("Second"),
                          items:List.generate(60, (index) {
                            return DropdownMenuItem(
                              value: index,
                              child: Text(index.toString()),
                            );
                          } ),
                          onChanged: (value){
                            setState(() {
                              second = value;
                            });
                          }),
                      OutlinedButton(
                          onPressed: (){
                            startTimer();
                            Navigator.of(context).pop();
                          },
                          child: Text("Start",style: TextStyle(color: Colors.deepPurple),))
                  ],
                ),
            );
          },
          child: Icon(Icons.alarm_add_outlined),
        ),
      ),
    );
  }
}
