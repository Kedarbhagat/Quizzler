import 'package:flutter/material.dart';
import 'package:quizzer_personal/quiz_%20brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_ brain.dart';
Quizbrain brain = Quizbrain()  ;

void main() => runApp(Quizzler());


class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: quizPage(),
      ),
    );
  }
}

class quizPage extends StatefulWidget {
  const quizPage({Key? key}) : super(key: key);

  @override
  State<quizPage> createState() => _quizPageState();
}
List<Widget> scorekeeper = [];
class _quizPageState extends State<quizPage> {



  var alertStyle = AlertStyle(
    animationType: AnimationType.fromTop,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.normal),
    descTextAlign: TextAlign.start,
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(
        color: Colors.black26,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
    ),
    alertAlignment: Alignment.center,
  );
  void checkAnswer(bool userPickedAnswer)
  {
setState(() {

  bool corectAnswer = brain.getQuestionAnswer();
  if (corectAnswer == userPickedAnswer) {
    print("this answer is correct");
    if(brain.queNo()<brain.Leng())
    {
          scorekeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        }
    else
      {
        Alert(context: context, title: "", desc: "you have reached the last question.",style: alertStyle).show();
        scorekeeper.clear() ;
      }
      }
  else {
    print('this answer is wrong ');
    if(brain.queNo()<brain.Leng())
    {
          scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
    else{
      Alert(context: context, title: "", desc: "you have reached the last question.").show();
      scorekeeper.clear() ;
    }
      }  brain.nextquestion() ;

});
  }

  @override
  Widget build(BuildContext context) {
    return  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                 brain.getQuestionNumber() ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.transparent),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true) ;
                  setState(() {

                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.transparent),
                  child: Text(
                    'False',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    checkAnswer(false) ;

                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(children: scorekeeper),
          )
        ]);
  }
}
