import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'drawer.dart';
import 'package:intl/intl.dart';

import 'voucher.dart';



class Ticket extends StatefulWidget {
  final movieName;

  Ticket(this.movieName);


  @override
  _TicketState createState() => _TicketState();
}

class _TicketState extends State<Ticket> {


  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _securityCodeController = TextEditingController();

  DateTime initialDate = DateTime.now();

  Future selectExpireDate(BuildContext context) async {
    final picked = await showDatePicker(
      firstDate: DateTime.now(),
      lastDate: DateTime((DateTime.now().year +2)),
      context: context,
      initialDate: initialDate,
    );
    if(picked != null && picked != initialDate){
      setState(() {
        initialDate = picked;
        print(initialDate.toString());
      });
    }
  }
  String error ='';
  int start = 4;

  void startTimer(){
    const oneSec = Duration(seconds: 1,);
    Timer timer = Timer.periodic( oneSec, (timer) {
      if(start==0){
        setState(() {
          timer.cancel();
          error='';
          start =5;
        });
      }
      else{
        setState(() {
          error='Compete you payment information please !';
          start--;
        });
      }
    });
  }

  int price=15;
  int quantity=1;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: BuildDrawer(),
        body: Stack(
          children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: kBoxDecoration,
            ),
            SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Container(
                  decoration: BoxDecoration(
                    color: kFirstColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  margin: EdgeInsets.all(20),
                  padding:  EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Wrap(
                      children: [
                        Center(child: Text('Book your ticket ',style: TextStyle(
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1,
                          fontFamily: 'RobotoMono',
                          fontSize: 16.0,
                          color: kSecondColor,
                        ),),),
                        SizedBox(height: size.height/15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Number of seat :',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: kSecondColor,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (quantity<2){
                                        quantity =quantity;
                                      }
                                      else quantity--;
                                    });
                                  },
                                  icon: Icon(Icons.remove),
                                  color: Colors.black,
                                  iconSize: 30,
                                ),
                                Container(
                                  width: 75.0,
                                  height: 45.0,
                                  decoration: BoxDecoration(
                                    color: kFirstColor,
                                    border: Border.all(color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "$quantity",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: kSecondColor,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if(quantity<31){
                                        quantity++;
                                      };
                                    });
                                  },
                                  icon: Icon(Icons.add),
                                  color: Colors.black,
                                  iconSize: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: size.height/12,),
                        Row(
                          children: <Widget>[
                            Text(
                              "Price :",
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF3a3a3b),
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Spacer(),
                            Text(
                              "${quantity*price} DT",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF3a3a3b),
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.left,
                            )
                          ],
                        ),
                        SizedBox(height: size.height/12,),
                        /// Full name
                        Text(
                          'Full name : ',
                          style: customTextStyle3,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical:10.0 ),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: kSecondColor ,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          height: 60.0,
                          child: TextField(
                            controller: _nameController,
                            keyboardType: TextInputType.text,
                            style: normalTextStyle,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0,right: 14.0),
                              prefixIcon: Icon(
                                Icons.person,
                                color: kFirstColor,
                              ),
                              hintText: 'Enter your full name',
                              hintStyle: kHintTextStyle,
                            ),
                          ),
                        ),
                        /// Email
                        Text(
                          'Email :',
                          style: customTextStyle3,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical:10.0 ),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: kSecondColor ,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          height: 60.0,
                          child: TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: normalTextStyle,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0,right: 14.0),
                              prefixIcon: Icon(
                                Icons.email,
                                color: kFirstColor,
                              ),
                              hintText: 'Enter your Email',
                              hintStyle: kHintTextStyle,
                            ),
                          ),
                        ),
                        /// Card Number
                        Text(
                          'Card number :',
                          style: customTextStyle3,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical:10.0 ),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: kSecondColor ,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          height: 60.0,
                          child: TextField(
                            controller: _cardNumberController,
                            keyboardType: TextInputType.number,
                            style: normalTextStyle,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0,right: 14.0),
                              prefixIcon: Icon(
                                Icons.credit_card_outlined,
                                color: kFirstColor,
                              ),
                              hintText: 'Enter your card number',
                              hintStyle: kHintTextStyle,
                            ),
                          ),
                        ),
                        /// Security Code
                        Text(
                          'Security Code :',
                          style: customTextStyle3,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical:10.0 ),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: kSecondColor ,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          height: 60.0,
                          child: TextField(
                            obscureText: true,
                            controller: _securityCodeController,
                            keyboardType: TextInputType.text,
                            style: normalTextStyle,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14.0,right: 14.0),
                              prefixIcon: Icon(
                                Icons.password_outlined,
                                color: kFirstColor,
                              ),
                              hintText: 'Enter your security code',
                              hintStyle: kHintTextStyle,
                            ),
                          ),
                        ),
                        /// Expire
                        _chooseExpireDate(),
                        SizedBox(height: size.height/15,),
                        Text(error,style: TextStyle(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1,
                          fontFamily: 'RobotoMono',
                          fontSize: 16.0,
                          color: Colors.red,
                        )),
                        SizedBox(height: size.height/8,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              child: Container(child: Card(child: Center(child: Text('Cancel',style: customTextStyle4)),color: kSecondColor),width: size.width/3,height: size.height/15, decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  border: null,
                                  color: kSecondColor
                              ),),
                              onTap: ()=>Navigator.pop(context),
                            ),
                            InkWell(
                              onTap: (){
                                if (widget.movieName.toString().isNotEmpty && _nameController.text.isNotEmpty && _emailController.text.isNotEmpty && _cardNumberController.text.isNotEmpty && initialDate.toString().isNotEmpty){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Voucher(widget.movieName,_nameController.text,_emailController.text,_cardNumberController.text,initialDate.toString(),quantity)));
                                }
                                else{
                                  startTimer();
                                }
                              },
                              child: Container(child: Card(child: Center(child: Text('Confirm',style: customTextStyle4)),color: kSecondColor),width: size.width/3,height: size.height/15, decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  border: null,
                                  color: kSecondColor
                              ),),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
  Widget _chooseExpireDate() {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
              'Expire :    ',
              style: customTextStyle3
          ),
          Container(
            decoration: BoxDecoration(
              color: kSecondColor,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
            width: MediaQuery.of(context).size.width /2.25,
            height: MediaQuery.of(context).size.height/20,
            child: FlatButton(
              color: kSecondColor,
              child: Text(
                DateFormat('dd-MM-yyyy').format(initialDate),
                style: customTextStyle4,
              ),
              onPressed: (){
                selectExpireDate(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
