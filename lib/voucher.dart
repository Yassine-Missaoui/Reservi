import 'package:flutter/material.dart';
import 'package:reservi2/constants.dart';
import 'package:intl/intl.dart';



class Voucher extends StatefulWidget {
  final mouvieName;
  final name;
  final email;
  final cardNumber;
  final expireDate;
  final quantity;
  const Voucher(this.mouvieName, this.name, this.email, this.cardNumber, this.expireDate, this.quantity);

  @override
  _VoucherState createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Column(
          children: [
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 20.0,
                color: kSecondColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.quantity>1? 'you\'ve got ${widget.quantity} tickets!' : 'you\'ve got ${widget.quantity}ticket!',
              style: TextStyle(
                fontSize: 20.0,
                color: kSecondColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      scrollable: true,
      content: SizedBox(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text(
              'Order Summary :     #######',
              style: TextStyle(
                fontSize: 16.0,
                color: kSecondColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              DateFormat('dd-MM-yyyy   hh:mm').format(DateTime.now()),
              style: TextStyle(
                fontSize: 16.0,
                color: kSecondColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      actions: [
        FlatButton(
          textColor: kSecondColor,
          onPressed: () => Navigator.pop(context),
          child: Text('OK'),
        ),
      ],
    );
  }
}
