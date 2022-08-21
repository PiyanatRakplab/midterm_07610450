import 'package:flutter/material.dart';

import 'package:midterm_07610450/tempcal.dart';

class Temppage extends StatefulWidget {
  @override
  State<Temppage> createState() => _TempPageState();
}

class _TempPageState extends State<Temppage> {
  final _controller = TextEditingController();
  final _temp = Temp_cal();

  var _feedbackText = '';
  var _showTestBotton = false;

  void handleClickGuess() {
    setState(() {
      _showTestBotton = !_showTestBotton;
    });
    print('Button clicked!');
    print(_controller.text);
    var guess = double.tryParse(_controller.text);
    if (guess == null) {
      // แจ้ง error
      print('Input error');
      setState(() {
        _feedbackText = 'Text error , please try again';
      });
    } else {
      var result = _temp.doGuess(guess);
      if (result == Result.tooHigh) {
        // ทายมากไป
        setState(() {
          _feedbackText = 'Too Hight , please try again';
        });
        print('Too high');
      } else if (result == Result.tooLow) {
        // ทายน้อยไป
        setState(() {
          _feedbackText = 'Too Low , please try again';
        });
        print('Too low');
      } else {
        // ทายถูก
        setState(() {
          _feedbackText = 'Correct';
        });
        print('Correct');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Midterm Exam'),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Temperature Converter'),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a temperature value to convert',
              ),
            ),
            // Callback function

            ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                onPressed: handleClickGuess,
                child: Text('Celesius to Fahrenheit')

            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
            ),
            ElevatedButton(

                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                onPressed: handleClickGuess,
                child: Text('Celesius to Celvin')
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
            ),


            ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                onPressed: handleClickGuess,
                child: Text('Fahrenheit to Celesius')

            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
            ),
            ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                onPressed: handleClickGuess,
                child: Text('Fahrenheit to Kelvin')
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
            ),

            ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                onPressed: handleClickGuess,
                child: Text('Kelvin to Celesius')
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
            ),
            ElevatedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                onPressed: handleClickGuess,
                child: Text('Celesius to Fahrenheit')
            ),
            Text(_feedbackText),
            /*Container(
              decoration: BoxDecoration(
                color: Colors.red, //สีพื้นหลังของ Container
                border: Border.all(
                  width: 5.0,
                  color: Colors.deepOrange,
                ),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),

            )*/


          ],
        ),
      ),

    );
  }

}


