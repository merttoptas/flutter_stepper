import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(

      theme: new ThemeData(
          primarySwatch: Colors.lightBlue,
      ),
      home: new MyHome(),


    );
  }
}
class MyHome extends StatefulWidget{
  @override
  MyHomeState createState() => new MyHomeState();
}

class MyHomeState extends State<MyHome> {
  int current_step = 0;

  List<Step> my_steps = [
    new Step(
        title: new Text("Adım 1"),
        content: new Text("Hello!"),
        isActive: true),
    new Step(
        title: new Text("Adım 2", textAlign: TextAlign.center,),
        content: new Text("World!"),
        state: StepState.editing,
        isActive: true),
    new Step(
        title: new Text("Adım 3"),
        content: new Text("Hello World!"),
        isActive: true),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
      appBar: new AppBar(
        // Title
        title: new Text("Flutter Stepper Tutorial "),
      ),
      // Body
      body: new Container(
          child: new Stepper(

            currentStep: this.current_step,
            steps: my_steps,
            type: StepperType.horizontal,
            onStepTapped: (step) {
              setState(() {
                current_step = step;
              });
              print("onStepTapped : " + step.toString());
            },
            onStepCancel: () {
              setState(() {
                if (current_step > 0) {
                  current_step = current_step - 1;
                } else {
                  current_step = 0;
                }
              });
              print("onStepCancel : " + current_step.toString());
            },
            onStepContinue: () {

              setState(() {
                if (current_step < my_steps.length - 1) {
                  current_step = current_step + 1;
                } else {
                  current_step = 0;
                }
              });
              print("onStepContinue : " + current_step.toString());
            },
          )),
    );
  }
  }