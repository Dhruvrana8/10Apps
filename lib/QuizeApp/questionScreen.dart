import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentOptionId ;
  bool isCorrect;
  @override
  Widget build(BuildContext context) {
    // final _question = Provider.of<QuizNotifier>(context).currentQuestion;
    final isCompletd = isCorrect != null;
    return Scaffold(
        appBar: VxAppBar(),
        body: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( question.text,
              style:Theme.of(context).textTheme.headline5,
              ),
              15.heightBox,
              for(var option in question.options)
              RadioListTile<int>(
                title: Text(option.text),
                groupValue: currentOptionId,
                onChanged: (value){
                  setState(() {
                    currentOptionId= value;
                  });
                },
                value:option.id,
              ),
              Spacer(),
              if(isCorrect != null)
                Text(isCorrect? "You are Correct! ✅":"You are Wrong ❌"),
              20.heightBox,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    if(isCompletd)
                      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => QuestionScreen())
                      );
                    if (currentOptionId != null)
                      setState(() {
                      isCorrect = currentOptionId == question.correctAnswerId;
                    });
                  },
                  child: Text(isCompletd ? "Continue":"Submit"),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
final questions = [question,question2];
final question = Question(
  text: "What is Flutter ?",correctAnswerId: 3,options: [
    Option(id: 1,text: "Wings Flapping"),
    Option(id: 2,text: "Programing Languager"),
    Option(id: 3,text: "Multi Platform UI kit"),
    Option(id: 4,text: "Word"),
],);
final question2 = Question(
  text: "What is Dart ?",correctAnswerId: 2,options: [
    Option(id: 1,text: "Wings Flapping"),
    Option(id: 2,text: "Programing Languager"),
    Option(id: 3,text: "Multi Platform UI kit"),
    Option(id: 4,text: "Word"),
],);

class Option{
  final int id;
  final String text;
  Option({this.text,this.id});
}
class Question{
  final int correctAnswerId;
  final String text;
  final List<Option> options;

  Question({this.text,this.correctAnswerId,this.options});
}
class QuizNotifier extends ChangeNotifier{
    final List<Question> questions;
    QuizNotifier(this.questions) : currentQuestion = questions.first, progress = 0;
    Question currentQuestion;
    int progress;
    bool isFinished= false;
    int score;
    void upDateProgress(){
      progress++;
      currentQuestion= questions[progress + 1 ];

      if(currentQuestion == questions.last)
        isFinished=true;
    }
}