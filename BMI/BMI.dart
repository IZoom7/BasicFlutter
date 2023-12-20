import 'dart:math';

import 'package:flutter/material.dart';

class BMI extends StatefulWidget {

  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();

}

class _BMIState extends State<BMI> {

  TextEditingController weightCtr = TextEditingController();

  TextEditingController hightCtr = TextEditingController();

  String result = "ไม่ระบุ";
  double _bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Center(

      child: Padding(

          padding: const EdgeInsets.all(15),

          child: Column(

            children: <Widget>[

              Padding(

                padding: const EdgeInsets.all(15),

                child: TextField(

                  controller: hightCtr,

                  decoration: const InputDecoration(

                    border: OutlineInputBorder(),

                    labelText: 'ส่วนสูง',

                    hintText: 'กรุณากรอกส่วนสูง',

                  ),

                ),

              ),

              Padding(

                padding: const EdgeInsets.all(15),

                child: TextField(

                  controller: weightCtr,

                  decoration: const InputDecoration(

                    border: OutlineInputBorder(),

                    labelText: 'น้ำหนัก',

                    hintText: 'กรุณากรอกน้ำหนัก',

                  ),

                ),

              ),

              ElevatedButton(

                child: const Text('คำนวณ'),

                onPressed: () {
                  calBMI();

                  setState(() {});
                },

              ),
              SizedBox(height: 15,),
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.calculate),
                      title: Text('ค่า BMI= ${_bmi.toStringAsFixed(2)}'),
                      subtitle: Text(this.result),
                    )
                  ],
                ),
              )
            ],

          )),

    );
  }

  void calBMI() {
    if (hightCtr.text == "" || weightCtr.text == "") {
      print("ไม่มีค่าส่งมาจากผู้ใช้");
    } else {
      var h = double.parse(hightCtr.text);

      var w = double.parse(weightCtr.text);

      print("น้ำหนัก: ${w}");

      print("ส่วนสูง: ${h}");

      var bmi = w / pow(h * 0.01, 2.0);

      print(bmi);
      this._bmi = bmi;
      if (bmi > 30) {
        result = "โครตอ้วน";
      } else if (bmi >= 25 && bmi < 30) {
        result = "เริ่มอ้วนแล้วนะ";
      } else {
        result = "ไม่สามารถคำนวณได้";

      }
      print(result);
    }
  }
}