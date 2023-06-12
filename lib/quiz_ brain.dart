import 'questons.dart';
import 'main.dart';
class Quizbrain{
  int _questionNumber = 0;

  // List Questions  = [
  //   'You can lead a cow upstairs but not downstairs' ,
  //    'Approximate one quarter of human bones are in the feet' ,
  //   'A slug\'s blood is green in color.'
  // ] ;
  // List answers = [false  , true , true] ;
  List<Question> _ques = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),


  ];

  int queNo()
  {
    return _questionNumber ;


  }
  int Leng()
  {
    return _ques.length-1 ;

  }


  void nextquestion()
  {
    if( _questionNumber<_ques.length-1) {
      _questionNumber++ ;
    }
    else
      {
        _questionNumber= 0 ;


      }
  }
  String getQuestionNumber()
  {
    print(_questionNumber) ;
    return _ques[_questionNumber].questionText ;




  }
  bool getQuestionAnswer()
  {

    return _ques[_questionNumber].questionAnswer;


  }


}