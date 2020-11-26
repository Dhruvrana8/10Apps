import 'package:coundown_timer/QuizeApp/questionScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class QuizeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primarySwatch: Colors.blue,
      ),
      child: Scaffold(
          appBar: VxAppBar(
            title: "Quiz App".text.makeCentered(),
            searchBar: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
                children: [
              "Flutter Provider Quiz".text.size(33).makeCentered(),
              50.heightBox,
              FlutterLogo(
                size: 150,
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => QuestionScreen())
                      );
                    },
                    child: "Start Quiz".text.make(),
                ),
              ),
                  50.heightBox,
            ]),
          ),
        ),
      );
  }
}
