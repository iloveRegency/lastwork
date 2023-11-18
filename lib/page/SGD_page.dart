import 'package:flutter/material.dart';
import 'package:librarybook/tranfer.dart';

import '../untils/converter.dart';

class SGDPage extends StatefulWidget {
  const SGDPage({Key? key}) : super(key: key);

  @override
  State<SGDPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SGDPage> {
  var _feedbackText = '';
  final _controller = TextEditingController(); //อ่านค่าจากTextField
  void _handleclick(int i){
    var input = _controller.text;  //รับมาเป็นสตรืง
    if(input==''){
      setState(() {
        _feedbackText = "กรุณาใส่จำนวนเงิน";
      });
      return;
    }
    var temp = double.tryParse(input); //แปลงสตริงเป็นดับเบิล
    if(temp==null){
      setState(() {
        _feedbackText = "กรุณาใส่เฉพาะตัวเลข";
      });
      return;
    }
    switch(i){
      case 1:
        setState(() {
          _feedbackText = "${temp.toStringAsFixed(2)} บาทเท่ากับ ${MyConverter.B2SGD(temp).toStringAsFixed(2)}ดอลลาร์สิงคโปร์";
        });
        break;
    }
  }
  Widget _buildButton(String msg,int i){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green[200]!),
          ),
          onPressed:(){_handleclick(i);},
          child: Text(msg,style: TextStyle(fontSize: 30))),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: Text(
          'แปลงสกุลเงินดอลลาร์สิงคโปร์',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('แปลงจากสกุลเงินบาทเป็นสกุลเงินดอลลาร์สิงคโปร์',style: TextStyle(fontSize: 40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/thai.png', width: 150.0,height:120.0,fit: BoxFit.cover),
                SizedBox(width: 30.0),
                Image.asset('assets/images/sorn.png', width: 200.0,height:100.0,fit: BoxFit.cover),
                SizedBox(width: 30.0),
                Image.asset('assets/images/SGD.png', width: 150.0,height:120.0,fit: BoxFit.cover),
              ],
            ),
            Container(
              margin: EdgeInsets.all(20.0), //ใส่ขอบ
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(
                  width: 5.0,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0,3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      textAlign: TextAlign.center, //ให้เริ่มพิมพ์ตรงกลาง
                      controller: _controller, //ค่าในข้อความ:ชื่อตัวแปร
                      style: TextStyle(   //กำหนดขนาด
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton("แปลงเป็นเงินดอลลาร์สิงคโปร์",1),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('อัตราแลกเปลี่ยน 1 ฿ = 0.03830 ดอลลาร์สิงคโปร์',style: TextStyle(fontSize: 30),)
                    ],
                  ),
                ],
              ),
            ),
            Text(_feedbackText,style: TextStyle(fontSize: 40),)
          ],
        ),
      ),
    );
  }
}
