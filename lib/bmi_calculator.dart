import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inchController = TextEditingController();

  var result = "";
  var bgColor = Colors.deepPurple[100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: const Text(
            'BMI Calculator',
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('BMI',
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: const InputDecoration(
                        label: Text('Enter Your Weight(Kgs)'),
                        prefixIcon: Icon(Icons.line_weight)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                        label: Text('Enter your Height(Feet)'),
                        prefixIcon: Icon(Icons.height)),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: inchController,
                    decoration: InputDecoration(
                      label: Text('Enter your height(Inch)'),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(

                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                      // ButtonStyle(
                      //   foregroundColor:
                      //       MaterialStateProperty.all<Color>(Colors.blueAccent),
                      //   overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      //     (Set<MaterialState> states) {
                      //       if (states.contains(MaterialState.hovered)) {
                      //         return Colors.blue;
                      //       }
                      //       if (states.contains(MaterialState.focused) ||
                      //           states.contains(MaterialState.pressed)) {
                      //         return Colors.blue;
                      //       }
                      //       return null;
                      //     },
                      //   ),
                      // ),

                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inch = inchController.text.toString();

                        if (wt != '' && ft != '' && inch != '') {
                          var iWt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iInch = int.parse(inch);

                          var totalInch = (ift * 12) + iInch;
                          var totalCm = totalInch * 2.54;
                          var totalM = totalCm / 100;
                          var bmi = iWt / (totalM * totalM);

                          var msg = '';
                          if(bmi>25){
                            msg = "You're OverWeight !";
                            bgColor = Colors.red[200];
                          }else if(bmi<18){
                            msg = "You're UnderWeight !";
                            bgColor = Colors.orange[200];
                          }
                          else{
                            msg = "You're Healthy ";
                            bgColor = Colors.green[200];
                          }
                          setState(() {
                            result = '$msg \n BMI is: ${bmi.toStringAsFixed(3)}';
                          });
                        } else {
                          setState(() {
                            result = 'Please fill all the required blanks !';
                          });
                        }
                      },
                      child: Text('Calculate',style: TextStyle(color: Colors.white),)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    result,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
