// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import 'package:math_expressions/math_expressions.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var userProblem="";

  var answer="";

  final List<String> buttons=[
    "C" , "DEL", "%", "/",
    "7" , "8", "9", "x",
    "4" , "5", "6", "-",
    "1" , "2", "3", "+",
    "0", "00", "." , "="
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //display answer and question
            Expanded(
              flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            userProblem,
                            style: TextStyle(
                              fontSize: 30
                            ),
                          )
                      ),

                      SizedBox(
                        width: double.infinity,
                        height: 1,
                        child: Container(
                          color: Colors.black45,
                        )
                      ),

                      Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            answer,
                            style: TextStyle(
                                fontSize: 30
                            ),
                          )
                      ),
                    ],
                  ),
                  color: Colors.white,
                ),
            ),


            //display keys
            Expanded(
              flex: 3,
                child: Container(
                  color: Colors.black87,
                  child: GridView.builder(
                    itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index){
                        if (index==0){
                          return Buttons(
                            buttonTapped:(){
                              setState(() {
                                userProblem="";
                                answer="";
                              });
                            } ,
                            value: buttons[index],
                            color: Colors.black,
                            textColor: Colors.redAccent,);
                        }

                        else if (index==1){
                          return Buttons(
                            buttonTapped:(){
                              setState(() {
                                userProblem=userProblem.substring(0,userProblem.length-1);
                              });
                            } ,
                            value: buttons[index],
                            color: Colors.black,
                            textColor: Colors.redAccent,);
                        }

                        else if (index==buttons.length-1){
                          return Buttons(
                            buttonTapped:(){
                              setState(() {
                                eqpressed();
                              });
                            } ,
                            value: buttons[index],
                            color: Colors.black,
                            textColor: Colors.lightGreenAccent,);
                        }

                        else {
                          return Buttons(
                            buttonTapped:(){
                              setState(() {
                                userProblem+=buttons[index];
                              });
                            } ,
                            value: buttons[index],
                            color: isOperator(buttons[index])? Colors.black: Colors.grey[800],
                            textColor: Colors.white,);
                        }
                      }
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }

  bool isOperator(String operator){
    if (operator=="/" || operator=="x" ||
        operator=="-" || operator=="+" ||
        operator=="%" || operator=="AC" ||
        operator=="Del" || operator=="=" ){
      return true;
    }else{
      return false;
    }
  }

  eqpressed(){
    String FinalProblem = userProblem;
    FinalProblem = FinalProblem.replaceAll("x", "*");

    Parser p = Parser();
    Expression exp = p.parse(FinalProblem);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    answer = eval.toString();
  }
}
